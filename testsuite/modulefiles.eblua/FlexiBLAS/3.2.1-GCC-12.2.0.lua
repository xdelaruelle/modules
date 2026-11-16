whatis("Description: module name and version")
local root = "/software/FlexiBLAS/3.2.1-GCC-12.2.0"
conflict("FlexiBLAS")
depends_on("GCC/12.2.0")
depends_on("OpenBLAS/0.3.21-GCC-12.2.0")
