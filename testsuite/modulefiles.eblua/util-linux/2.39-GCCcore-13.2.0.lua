whatis("Description: module name and version")
local root = "/software/util-linux/2.39-GCCcore-13.2.0"
conflict("util-linux")
depends_on("GCCcore/13.2.0")
depends_on("ncurses/6.4-GCCcore-13.2.0")
depends_on("zlib/1.2.13-GCCcore-13.2.0")
