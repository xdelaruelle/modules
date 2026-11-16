whatis("Description: module name and version")
local root = "/software/FlexiBLAS/3.3.1-GCC-13.2.0"
conflict("FlexiBLAS")
depends_on("GCC/13.2.0")
depends_on("OpenBLAS/0.3.24-GCC-13.2.0")
