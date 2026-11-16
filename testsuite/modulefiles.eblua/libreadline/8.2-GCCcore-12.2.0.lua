whatis("Description: module name and version")
local root = "/software/libreadline/8.2-GCCcore-12.2.0"
conflict("libreadline")
depends_on("GCCcore/12.2.0")
depends_on("ncurses/6.3-GCCcore-12.2.0")
