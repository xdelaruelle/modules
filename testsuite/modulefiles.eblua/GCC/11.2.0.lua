whatis("Description: module name and version")
local root = "/software/GCC/11.2.0"
conflict("GCC")
depends_on("GCCcore/11.2.0")
depends_on("binutils/2.37-GCCcore-11.2.0")
