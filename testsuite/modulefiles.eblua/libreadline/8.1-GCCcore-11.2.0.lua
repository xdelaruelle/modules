whatis("Description: module name and version")
local root = "/software/libreadline/8.1-GCCcore-11.2.0"
conflict("libreadline")
depends_on("GCCcore/11.2.0")
depends_on("ncurses/6.2-GCCcore-11.2.0")
