whatis("Description: module name and version")
local root = "/software/foss/2023b"
conflict("foss")
depends_on("GCC/13.2.0")
depends_on("OpenMPI/4.1.6-GCC-13.2.0")
depends_on("FlexiBLAS/3.3.1-GCC-13.2.0")
depends_on("FFTW/3.3.10-GCC-13.2.0")
depends_on("FFTW.MPI/3.3.10-gompi-2023b")
depends_on("ScaLAPACK/2.2.0-gompi-2023b-fb")
