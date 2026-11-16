whatis("Description: module name and version")
local root = "/software/HDF5/1.14.0-gompi-2022b"
conflict("HDF5")
depends_on("gompi/2022b")
depends_on("zlib/1.2.12-GCCcore-12.2.0")
depends_on("Szip/2.1.1-GCCcore-12.2.0")
setenv("HDF5_DIR", "/software/HDF5/1.14.0-gompi-2022b")
