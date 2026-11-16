whatis("Description: module name and version")
local root = "/software/util-linux/2.36-GCCcore-10.3.0"
conflict("util-linux")
depends_on("GCCcore/10.3.0")
depends_on("ncurses/6.2-GCCcore-10.3.0")
depends_on("zlib/1.2.11-GCCcore-10.3.0")
