whatis("Description: module name and version")
local root = "/software/FFTW.MPI/3.3.10-gompi-2023b"
conflict("FFTW.MPI")
depends_on("gompi/2023b")
depends_on("FFTW/3.3.10-GCC-13.2.0")
