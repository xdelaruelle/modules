whatis("Description: module name and version")
local root = "/software/foss/2021b"
conflict("foss")
depends_on("GCC/11.2.0")
depends_on("OpenMPI/4.1.1-GCC-11.2.0")
depends_on("FlexiBLAS/3.0.4-GCC-11.2.0")
depends_on("FFTW/3.3.10-gompi-2021b")
depends_on("ScaLAPACK/2.1.0-gompi-2021b-fb")
