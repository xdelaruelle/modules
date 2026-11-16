whatis("Description: module name and version")
local root = "/software/foss/2021a"
conflict("foss")
depends_on("GCC/10.3.0")
depends_on("OpenMPI/4.1.1-GCC-10.3.0")
depends_on("FlexiBLAS/3.0.4-GCC-10.3.0")
depends_on("FFTW/3.3.9-gompi-2021a")
depends_on("ScaLAPACK/2.1.0-gompi-2021a-fb")
