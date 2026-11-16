whatis("Description: module name and version")
local root = "/software/binutils/2.39-GCCcore-12.2.0"
conflict("binutils")
depends_on("GCCcore/12.2.0")
depends_on("zlib/1.2.12-GCCcore-12.2.0")
