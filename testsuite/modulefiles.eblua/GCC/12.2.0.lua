whatis("Description: module name and version")
local root = "/software/GCC/12.2.0"
conflict("GCC")
depends_on("GCCcore/12.2.0")
depends_on("binutils/2.39-GCCcore-12.2.0")
