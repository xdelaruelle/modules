whatis("Description: module name and version")
local root = "/software/netCDF/4.8.1-gompi-2021b"
conflict("netCDF")
depends_on("gompi/2021b")
depends_on("HDF5/1.12.1-gompi-2021b")
depends_on("cURL/7.78.0-GCCcore-11.2.0")
depends_on("Szip/2.1.1-GCCcore-11.2.0")
