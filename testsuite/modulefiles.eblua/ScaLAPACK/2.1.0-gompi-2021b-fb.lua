whatis("Description: module name and version")
local root = "/software/ScaLAPACK/2.1.0-gompi-2021b-fb"
conflict("ScaLAPACK")
depends_on("gompi/2021b")
depends_on("FlexiBLAS/3.0.4-GCC-11.2.0")
