whatis("Description: module name and version")
local root = "/software/GCC/11.3.0"
conflict("GCC")
depends_on("GCCcore/11.3.0")
depends_on("binutils/2.38-GCCcore-11.3.0")
