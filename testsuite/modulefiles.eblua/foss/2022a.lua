whatis("Description: module name and version")
local root = "/software/foss/2022a"
conflict("foss")
depends_on("GCC/11.3.0")
depends_on("OpenMPI/4.1.4-GCC-11.3.0")
depends_on("FlexiBLAS/3.2.0-GCC-11.3.0")
depends_on("FFTW/3.3.10-GCC-11.3.0")
depends_on("FFTW.MPI/3.3.10-gompi-2022a")
depends_on("ScaLAPACK/2.2.0-gompi-2022a-fb")
