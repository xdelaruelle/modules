whatis("Description: module name and version")
local root = "/software/FlexiBLAS/3.2.0-GCC-11.3.0"
conflict("FlexiBLAS")
depends_on("GCC/11.3.0")
depends_on("OpenBLAS/0.3.20-GCC-11.3.0")
