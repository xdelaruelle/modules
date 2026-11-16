whatis("Description: module name and version")
local root = "/software/binutils/2.36.1-GCCcore-10.3.0"
conflict("binutils")
depends_on("GCCcore/10.3.0")
depends_on("zlib/1.2.11-GCCcore-10.3.0")
