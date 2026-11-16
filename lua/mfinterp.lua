-- MFINTERP.LUA, Lua modulefile interpreter translating to Tcl
-- Copyright (C) 2026 Xavier Delaruelle
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

-- PROTOTYPE: throw-away implementation to validate the design

-- local references to standard functions, so code loaded by modulefiles
-- cannot break the bridge by redefining a global function
local assert, error, ipairs, pairs, pcall, select, setmetatable, tostring,
   type, rawset, tonumber, next =
   assert, error, ipairs, pairs, pcall, select, setmetatable, tostring,
   type, rawset, tonumber, next
local lua_load = load
local require = require
local string, table, os, io, math, debug = string, table, os, io, math, debug
local concat = table.concat
local gsub, find, sub = string.gsub, string.find, string.sub
local getinfo = debug.getinfo
local os_exit = os.exit

do
   local major, minor = string.match(_VERSION, "(%d+)%.(%d+)")
   if tonumber(major) * 100 + tonumber(minor) < 503 then
      io.stderr:write("mfinterp.lua requires Lua 5.3 or newer\n")
      os_exit(1)
   end
end

local unistd = require("posix.unistd")
local fcntl = require("posix.fcntl")
local stdio = require("posix.stdio")
local posix_setenv = require("posix.stdlib").setenv


-- ##########################################################################
-- Bridge
-- ##########################################################################

-- move bridge away from stdin and stdout, which are left to the commands
-- executed by modulefiles
local FD_CLOEXEC = fcntl.FD_CLOEXEC or 1
local function moveFd(fd)
   local newfd = assert(fcntl.fcntl(fd, fcntl.F_DUPFD, 10))
   fcntl.fcntl(newfd, fcntl.F_SETFD, FD_CLOEXEC)
   return newfd
end
local inp = stdio.fdopen(moveFd(0), "r")
local out = stdio.fdopen(moveFd(1), "w")
out:setvbuf("full")
unistd.dup2(2, 1)
do
   local nullfd = fcntl.open("/dev/null", fcntl.O_RDONLY)
   unistd.dup2(nullfd, 0)
   unistd.close(nullfd)
end

-- quote a string as a Tcl list element
local tcl_escape = {}
for _, c in ipairs({" ", "{", "}", "[", "]", "$", '"', "\\", ";"}) do
   tcl_escape[c] = "\\" .. c
end
tcl_escape["\n"] = "\\n"
tcl_escape["\r"] = "\\r"
tcl_escape["\t"] = "\\t"
tcl_escape["\v"] = "\\v"
tcl_escape["\f"] = "\\f"
local function tclQuote(str)
   if str == "" then
      return "{}"
   elseif find(str, '[%s{}%[%]$"\\;]') then
      return (gsub(str, '[%s{}%[%]$"\\;]', tcl_escape))
   else
      return str
   end
end

-- stack of evaluation contexts
local ctx_stack = {}
local ctx_depth = 0
local ctx

-- properties that are constant for an evaluation mode
local mode_props = {}

local STOP = setmetatable({}, {__tostring = function()
   return "evaluation stop"
end})

local evalModulefile

-- environment variables changed on Tcl side whose value is not fetched yet
local stale_env = {}
local function staleEnv(names)
   for i = 1, #names do
      stale_env[names[i]] = true
   end
end

-- wait for the reply to the command sent. evaluation requests received in
-- between are nested evaluations
local function waitReply()
   while true do
      local line = inp:read("l")
      if not line then
         os_exit(0)
      end
      local kind, value, env, code = lua_load(line)()
      if kind == "eval" then
         -- (properties, content, environment changes)
         evalModulefile(value, env, code)
      else
         if env then
            staleEnv(env)
         end
         return kind, value, code
      end
   end
end

-- location in modulefile of the function call currently processed
local function callLocation()
   local source = ctx.source
   local level = 3
   while true do
      local info = getinfo(level, "Sl")
      if not info then
         return ""
      elseif info.source == source then
         return ctx.props.modulefile .. ":" .. info.currentline .. ": "
      end
      level = level + 1
   end
end

local function exchange(msg)
   out:write(msg, "\n")
   out:flush()
   local status, value, code = waitReply()
   if status == "ok" then
      return value
   elseif status == "stop" then
      ctx.stop = true
      error(STOP, 0)
   else
      -- errors that Tcl side knows how to render are raised as-is
      if not find(code, "^MODULES_ERR_") then
         value = callLocation() .. value
         code = "MODULES_ERR_LUA"
      end
      ctx.tcl_err_msg = value
      ctx.tcl_err_code = code
      error(value, 0)
   end
end

-- send Tcl modulefile command to evaluate
local function tcl(cmd, ...)
   local c = ctx
   if c.stop then
      error(STOP, 0)
   elseif c.nop[cmd] then
      return
   end
   local n = select("#", ...)
   if n == 1 then
      return exchange("c " .. cmd .. " " .. tclQuote(...))
   end
   local parts = {"c", cmd, ...}
   for i = 3, n + 2 do
      parts[i] = tclQuote(parts[i])
   end
   return exchange(concat(parts, " "))
end

-- call helper procedure of main Tcl interpreter
local function helper(name, ...)
   if ctx.stop then
      error(STOP, 0)
   end
   local parts = {"h", name, ...}
   for i = 3, #parts do
      parts[i] = tclQuote(parts[i])
   end
   return exchange(concat(parts, " "))
end


-- ##########################################################################
-- Lmod modulefile functions
-- ##########################################################################

local M = {}

local function checkStrings(name, ...)
   for i = 1, select("#", ...) do
      local arg = select(i, ...)
      local t = type(arg)
      if t == "number" then
         -- numbers are accepted where a string is expected
      elseif t ~= "string" then
         error(callLocation() .. "bad argument #" .. i .. " to '" .. name ..
            "' (string expected, got " .. t .. ")", 0)
      end
   end
end

-- translate version modifier objects into advanced version specifiers
local function modSpecs(name, ...)
   local n = select("#", ...)
   if n == 1 then
      local arg = ...
      if type(arg) == "string" then
         return arg
      end
   end
   local res = {...}
   for i = 1, n do
      local arg = res[i]
      if type(arg) == "table" and arg.modspec then
         res[i] = arg.modspec
      elseif type(arg) ~= "string" then
         error(callLocation() .. "bad argument #" .. i .. " to '" .. name ..
            "' (string expected, got " .. type(arg) .. ")", 0)
      end
   end
   return (table.unpack or unpack)(res, 1, n)
end

function M.atleast(name, version)
   return {modspec = name .. "@" .. version .. ":"}
end
function M.atmost(name, version)
   return {modspec = name .. "@:" .. version}
end
function M.between(name, low, high)
   return {modspec = name .. "@" .. low .. ":" .. high}
end
function M.latest(name)
   return {modspec = name .. "@latest"}
end

function M.whatis(str)
   checkStrings("whatis", str)
   tcl("module-whatis", str)
end

function M.help(...)
   checkStrings("help", ...)
   tcl("module-help", concat({...}))
end

function M.setenv(name, value, respect)
   checkStrings("setenv", name, value)
   if respect then
      tcl("setenv", "--set-if-undef", name, tostring(value))
   else
      tcl("setenv", name, tostring(value))
   end
end

function M.unsetenv(name)
   checkStrings("unsetenv", name)
   tcl("unsetenv", name)
end

function M.pushenv(name, value)
   checkStrings("pushenv", name)
   tcl("pushenv", name, value and tostring(value) or "")
end

local function pathFunction(lua_name, tcl_name, extra_opt)
   M[lua_name] = function(name, value, delim)
      local priority
      if type(name) == "table" then
         local t = name
         name, value, delim, priority = t[1], t[2], t.delim, t.priority
      end
      checkStrings(lua_name, name, value)
      local args = {}
      if extra_opt then
         args[#args + 1] = extra_opt
      end
      if delim then
         args[#args + 1] = "--delim"
         args[#args + 1] = delim
      end
      if priority then
         args[#args + 1] = "--priority"
         args[#args + 1] = tostring(priority)
      end
      args[#args + 1] = name
      args[#args + 1] = tostring(value)
      tcl(tcl_name, (table.unpack or unpack)(args))
   end
end
pathFunction("prepend_path", "prepend-path")
pathFunction("append_path", "append-path")
pathFunction("remove_path", "remove-path", "--remove-on-unload")

local function moduleSubCmd(lua_name, subcmd)
   M[lua_name] = function(...)
      tcl("module", subcmd, modSpecs(lua_name, ...))
   end
end
moduleSubCmd("load_module", "load")
moduleSubCmd("try_load", "try-load")
moduleSubCmd("load_any", "load-any")
moduleSubCmd("unload", "unload")
M.try_add = M.try_load
M.always_unload = M.unload

function M.purge()
   tcl("module", "purge")
end

local function specCommand(lua_name, tcl_name)
   M[lua_name] = function(...)
      tcl(tcl_name, modSpecs(lua_name, ...))
   end
end
specCommand("depends_on", "depends-on")
specCommand("depends_on_any", "depends-on-any")
specCommand("prereq", "prereq-all")
specCommand("prereq_any", "prereq-any")
specCommand("conflict", "conflict")
specCommand("always_load", "always-load")

local function stringCommand(lua_name, tcl_name)
   M[lua_name] = function(...)
      checkStrings(lua_name, ...)
      tcl(tcl_name, ...)
   end
end
stringCommand("family", "family")
stringCommand("set_alias", "set-alias")
stringCommand("unset_alias", "unset-alias")
stringCommand("requireFullName", "require-fullname")

function M.add_property(name, value)
   checkStrings("add_property", name, value)
   tcl("add-property", name, value)
end

function M.extensions(...)
   checkStrings("extensions", ...)
   local names = {}
   for name in string.gmatch(concat({...}, ","), "[^,%s]+") do
      names[#names + 1] = name
   end
   tcl("extensions", (table.unpack or unpack)(names))
end

function M.set_shell_function(name, sh_body, csh_body)
   checkStrings("set_shell_function", name, sh_body, csh_body)
   if ctx.mode_props.shelltype == "csh" then
      tcl("set-alias", name, csh_body)
   else
      tcl("set-function", name, sh_body)
   end
end

function M.isloaded(...)
   local spec = modSpecs("isloaded", ...)
   return tcl("is-loaded", spec) == "1" or helper("is-loading", spec)
end

function M.isAvail(...)
   return tcl("is-avail", modSpecs("isAvail", ...)) == "1"
end

function M.isPending(...)
   return helper("is-loading", modSpecs("isPending", ...))
end

function M.LmodMessage(...)
   local mode = ctx.props.mode
   if mode ~= "whatis" and mode ~= "help" and mode ~= "scan" and
      mode ~= "refresh" then
      tcl("puts", "stderr", concat({...}))
   end
end

function M.LmodWarning(...)
   tcl("reportWarning", concat({...}))
end

function M.LmodError(...)
   local mode = ctx.props.mode
   if mode == "unload" then
      tcl("reportWarning", concat({...}))
   elseif mode ~= "whatis" and mode ~= "help" and mode ~= "scan" then
      tcl("error", concat({...}), "", "MODULES_ERR_GLOBAL")
   end
end

function M.LmodBreak(...)
   if ctx.props.mode == "load" then
      if select("#", ...) > 0 then
         tcl("puts", "stderr", concat({...}))
      end
      tcl("break")
   end
end

function M.LmodVersion()
   return "9.4"
end

local lmod_mode = {display = "show", scan = "spider", refresh = "load"}
function M.mode()
   local mode = ctx.props.mode
   return lmod_mode[mode] or mode
end

function M.myFileName()
   return ctx.props.modulefile
end
function M.myModuleFullName()
   return ctx.props.modulename
end
function M.myModuleUsrName()
   return ctx.props.specifiedname
end
function M.myModuleName()
   local full = ctx.props.modulename
   return string.match(full, "^(.*)/[^/]*$") or full
end
function M.myModuleVersion()
   return string.match(ctx.props.modulename, "^.*/([^/]*)$") or ""
end
function M.myShellName()
   return ctx.mode_props.shell
end
function M.myShellType()
   local shelltype = ctx.mode_props.shelltype
   return shelltype
end

function M.pathJoin(...)
   local parts = {}
   for i = 1, select("#", ...) do
      local part = select(i, ...)
      if part and part ~= "" then
         parts[#parts + 1] = part
      end
   end
   local res = gsub(concat(parts, "/"), "//+", "/")
   if #res > 1 then
      res = gsub(res, "/$", "")
   end
   return res
end

local lfs
local function lfsAttr(path, attr)
   lfs = lfs or require("lfs")
   return lfs.attributes(path, attr)
end
function M.isDir(path)
   return lfsAttr(path, "mode") == "directory"
end
function M.isFile(path)
   local mode = lfsAttr(path, "mode")
   return mode ~= nil and mode ~= "directory"
end

-- value of the environment variables changed on Tcl side is fetched when
-- modulefile reads them or runs a command
local function fetchEnv(...)
   for var, val in pairs(helper("getenv", ...)) do
      posix_setenv(var, val or nil)
      stale_env[var] = nil
   end
end
local function syncEnv()
   if next(stale_env) then
      local names = {}
      for name in pairs(stale_env) do
         names[#names + 1] = name
      end
      fetchEnv(table.unpack(names))
   end
end
local os_getenv = os.getenv
local function getenv(name)
   if stale_env[name] then
      fetchEnv(name)
   end
   return os_getenv(name)
end

function M.capture(cmd)
   syncEnv()
   local pipe = io.popen(cmd)
   local res = pipe:read("a")
   pipe:close()
   return res
end

function M.execute(t)
   local modeA = t.modeA or {}
   local cur = M.mode()
   for _, mode in ipairs(modeA) do
      if mode == "all" or mode == cur then
         tcl("puts", "stdout", t.cmd)
         break
      end
   end
end

local function noop()
end
M.remove_property = noop
M.export_shell_function = noop
M.haveDynamicMPATH = noop
M.dbg = {active = noop, fini = noop, print = noop, print2D = noop,
   printA = noop, printT = noop, start = noop}


-- ##########################################################################
-- Sandbox
-- ##########################################################################

local function copyTable(t)
   local res = {}
   for k, v in pairs(t) do
      res[k] = v
   end
   return res
end

local function output(...)
   local parts = {}
   for i = 1, select("#", ...) do
      parts[i] = tostring((select(i, ...)))
   end
   return parts
end

local function writeOutput(...)
   tcl("puts", "-nonewline", "stderr", concat(output(...)))
end

local out_file = {
   write = function(self, ...)
      writeOutput(...)
      return self
   end,
   flush = noop,
   close = noop,
   setvbuf = noop,
}

-- library tables an evaluation gets its own copy of at first access
local base_libs = {
   string = copyTable(string),
   table = copyTable(table),
   math = copyTable(math),
   os = copyTable(os),
   io = copyTable(io),
   package = package,
}
base_libs.os.exit = function(code)
   tcl("exit", code and tostring(code) or "0")
end
base_libs.os.getenv = getenv
do
   local os_execute, io_popen = os.execute, io.popen
   base_libs.os.execute = function(...)
      syncEnv()
      return os_execute(...)
   end
   base_libs.io.popen = function(...)
      syncEnv()
      return io_popen(...)
   end
end
base_libs.io.write = writeOutput
base_libs.io.stdout = out_file
base_libs.io.stderr = out_file

local base_env = {
   assert = assert, error = error, ipairs = ipairs, pairs = pairs,
   next = next, pcall = pcall, select = select, tonumber = tonumber,
   tostring = tostring, type = type, require = require, loadfile = loadfile,
   getmetatable = getmetatable, setmetatable = setmetatable, rawget = rawget,
   rawset = rawset, xpcall = xpcall, _VERSION = _VERSION,
   loadstring = lua_load,
   unpack = table.unpack,
   print = function(...)
      tcl("puts", "stderr", concat(output(...), "\t"))
   end,
   dofile = function()
      error("dofile is not supported", 2)
   end,
}
for name, func in pairs(M) do
   base_env[name] = func
   -- also reachable by code loaded with require or loadfile
   _G[name] = func
end
base_env.load = M.load_module

local env_mt = {__index = function(t, name)
   local lib = base_libs[name]
   if lib then
      if name ~= "package" then
         lib = copyTable(lib)
      end
      rawset(t, name, lib)
      return lib
   elseif name == "lfs" then
      lfs = lfs or require("lfs")
      return lfs
   elseif name == "posix" then
      return require("posix")
   end
   return base_env[name]
end}


-- ##########################################################################
-- Evaluation
-- ##########################################################################

function evalModulefile(props, content, env)
   if env then
      staleEnv(env)
   end
   local mode = props.mode
   if props.nop then
      mode_props[mode] = {nop = props.nop, shell = props.shell,
         shelltype = props.shelltype}
   end
   local modulefile = props.modulefile
   local source = "@" .. modulefile
   local new_ctx = {props = props, source = source,
      mode_props = mode_props[mode], nop = mode_props[mode].nop}
   ctx_depth = ctx_depth + 1
   ctx_stack[ctx_depth] = new_ctx
   ctx = new_ctx

   -- blank first line if it is a comment in shell syntax
   if sub(content, 1, 1) == "#" then
      content = gsub(content, "^[^\n]*", "", 1)
   end

   local func, err = lua_load(content, source, "t", setmetatable({}, env_mt))
   local ok = true
   if func then
      ok, err = pcall(func)
   else
      ok = false
   end

   local msg = "e"
   if not ok and err ~= STOP and not new_ctx.stop then
      local code = "MODULES_ERR_LUA"
      if err == nil then
         err = "nil"
      elseif err == new_ctx.tcl_err_msg then
         code = new_ctx.tcl_err_code
      else
         err = tostring(err)
         -- restore full modulefile path that Lua shortens in its messages
         if #modulefile > 50 then
            local short = getinfo(func or lua_load("", source), "S").short_src
            local first, last = find(err, short, 1, true)
            if first == 1 then
               err = modulefile .. sub(err, last + 1)
            end
         end
      end
      msg = "e " .. tclQuote(err) .. " " .. code
   end

   ctx_stack[ctx_depth] = nil
   ctx_depth = ctx_depth - 1
   ctx = ctx_stack[ctx_depth]

   out:write(msg, "\n")
   out:flush()
end

-- main loop: wait for evaluation requests until bridge is closed
while true do
   local line = inp:read("l")
   if not line then
      break
   end
   local kind, props, content, env = lua_load(line)()
   if kind == "eval" then
      evalModulefile(props, content, env)
   end
end
os_exit(0)
