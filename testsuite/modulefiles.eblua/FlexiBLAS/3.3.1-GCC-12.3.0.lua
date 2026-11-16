whatis("Description: module name and version")
local root = "/software/FlexiBLAS/3.3.1-GCC-12.3.0"
conflict("FlexiBLAS")
depends_on("GCC/12.3.0")
depends_on("OpenBLAS/0.3.23-GCC-12.3.0")
