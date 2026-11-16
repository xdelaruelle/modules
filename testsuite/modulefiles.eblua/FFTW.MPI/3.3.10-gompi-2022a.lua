whatis("Description: module name and version")
local root = "/software/FFTW.MPI/3.3.10-gompi-2022a"
conflict("FFTW.MPI")
depends_on("gompi/2022a")
depends_on("FFTW/3.3.10-GCC-11.3.0")
