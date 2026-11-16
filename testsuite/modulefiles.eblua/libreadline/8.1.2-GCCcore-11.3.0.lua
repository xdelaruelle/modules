whatis("Description: module name and version")
local root = "/software/libreadline/8.1.2-GCCcore-11.3.0"
conflict("libreadline")
depends_on("GCCcore/11.3.0")
depends_on("ncurses/6.3-GCCcore-11.3.0")
