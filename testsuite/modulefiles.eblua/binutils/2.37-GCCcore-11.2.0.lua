whatis("Description: module name and version")
local root = "/software/binutils/2.37-GCCcore-11.2.0"
conflict("binutils")
depends_on("GCCcore/11.2.0")
depends_on("zlib/1.2.11-GCCcore-11.2.0")
