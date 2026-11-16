whatis("Description: module name and version")
local root = "/software/netCDF/4.8.0-gompi-2021a"
conflict("netCDF")
depends_on("gompi/2021a")
depends_on("HDF5/1.10.7-gompi-2021a")
depends_on("cURL/7.76.0-GCCcore-10.3.0")
depends_on("Szip/2.1.1-GCCcore-10.3.0")
