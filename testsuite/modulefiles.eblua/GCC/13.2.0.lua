whatis("Description: module name and version")
local root = "/software/GCC/13.2.0"
conflict("GCC")
depends_on("GCCcore/13.2.0")
depends_on("binutils/2.40-GCCcore-13.2.0")
