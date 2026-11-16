whatis("Description: module name and version")
local root = "/software/binutils/2.40-GCCcore-13.2.0"
conflict("binutils")
depends_on("GCCcore/13.2.0")
depends_on("zlib/1.2.13-GCCcore-13.2.0")
