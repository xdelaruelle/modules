whatis("Description: module name and version")
local root = "/software/GCC/12.3.0"
conflict("GCC")
depends_on("GCCcore/12.3.0")
depends_on("binutils/2.40-GCCcore-12.3.0")
