whatis("Description: module name and version")
local root = "/software/ScaLAPACK/2.1.0-gompi-2021a-fb"
conflict("ScaLAPACK")
depends_on("gompi/2021a")
depends_on("FlexiBLAS/3.0.4-GCC-10.3.0")
