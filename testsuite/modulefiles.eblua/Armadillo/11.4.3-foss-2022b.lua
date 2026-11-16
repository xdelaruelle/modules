whatis("Description: module name and version")
local root = "/software/Armadillo/11.4.3-foss-2022b"
conflict("Armadillo")
depends_on("foss/2022b")
depends_on("Boost/1.81.0-GCC-12.2.0")
depends_on("HDF5/1.14.0-gompi-2022b")
depends_on("arpack-ng/3.8.0-foss-2022b")
