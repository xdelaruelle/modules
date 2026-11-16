whatis("Description: module name and version")
local root = "/software/HDF5/1.10.7-gompi-2021a"
conflict("HDF5")
depends_on("gompi/2021a")
depends_on("zlib/1.2.11-GCCcore-10.3.0")
depends_on("Szip/2.1.1-GCCcore-10.3.0")
setenv("HDF5_DIR", "/software/HDF5/1.10.7-gompi-2021a")
