whatis("Description: module name and version")
local root = "/software/Armadillo/12.6.2-foss-2023a"
conflict("Armadillo")
depends_on("foss/2023a")
depends_on("Boost/1.82.0-GCC-12.3.0")
depends_on("HDF5/1.14.0-gompi-2023a")
depends_on("arpack-ng/3.9.0-foss-2023a")
