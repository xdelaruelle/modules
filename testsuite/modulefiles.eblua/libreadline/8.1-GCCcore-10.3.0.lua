whatis("Description: module name and version")
local root = "/software/libreadline/8.1-GCCcore-10.3.0"
conflict("libreadline")
depends_on("GCCcore/10.3.0")
depends_on("ncurses/6.2-GCCcore-10.3.0")
