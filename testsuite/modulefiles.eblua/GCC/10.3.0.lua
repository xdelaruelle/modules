whatis("Description: module name and version")
local root = "/software/GCC/10.3.0"
conflict("GCC")
depends_on("GCCcore/10.3.0")
depends_on("binutils/2.36.1-GCCcore-10.3.0")
