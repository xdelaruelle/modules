whatis("Description: module name and version")
local root = "/software/util-linux/2.38-GCCcore-11.3.0"
conflict("util-linux")
depends_on("GCCcore/11.3.0")
depends_on("ncurses/6.3-GCCcore-11.3.0")
depends_on("zlib/1.2.12-GCCcore-11.3.0")
