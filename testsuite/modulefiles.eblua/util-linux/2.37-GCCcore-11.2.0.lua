whatis("Description: module name and version")
local root = "/software/util-linux/2.37-GCCcore-11.2.0"
conflict("util-linux")
depends_on("GCCcore/11.2.0")
depends_on("ncurses/6.2-GCCcore-11.2.0")
depends_on("zlib/1.2.11-GCCcore-11.2.0")
