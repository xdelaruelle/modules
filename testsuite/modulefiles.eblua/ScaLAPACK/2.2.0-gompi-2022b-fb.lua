whatis("Description: module name and version")
local root = "/software/ScaLAPACK/2.2.0-gompi-2022b-fb"
conflict("ScaLAPACK")
depends_on("gompi/2022b")
depends_on("FlexiBLAS/3.2.1-GCC-12.2.0")
