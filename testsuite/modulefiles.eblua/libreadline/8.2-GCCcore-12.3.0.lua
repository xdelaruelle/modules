whatis("Description: module name and version")
local root = "/software/libreadline/8.2-GCCcore-12.3.0"
conflict("libreadline")
depends_on("GCCcore/12.3.0")
depends_on("ncurses/6.4-GCCcore-12.3.0")
