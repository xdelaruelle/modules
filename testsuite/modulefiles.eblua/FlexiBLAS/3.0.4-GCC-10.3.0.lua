whatis("Description: module name and version")
local root = "/software/FlexiBLAS/3.0.4-GCC-10.3.0"
conflict("FlexiBLAS")
depends_on("GCC/10.3.0")
depends_on("OpenBLAS/0.3.15-GCC-10.3.0")
