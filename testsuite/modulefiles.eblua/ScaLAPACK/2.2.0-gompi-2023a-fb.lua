whatis("Description: module name and version")
local root = "/software/ScaLAPACK/2.2.0-gompi-2023a-fb"
conflict("ScaLAPACK")
depends_on("gompi/2023a")
depends_on("FlexiBLAS/3.3.1-GCC-12.3.0")
