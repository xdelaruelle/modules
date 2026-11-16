whatis("Description: module name and version")
local root = "/software/ScaLAPACK/2.2.0-gompi-2022a-fb"
conflict("ScaLAPACK")
depends_on("gompi/2022a")
depends_on("FlexiBLAS/3.2.0-GCC-11.3.0")
