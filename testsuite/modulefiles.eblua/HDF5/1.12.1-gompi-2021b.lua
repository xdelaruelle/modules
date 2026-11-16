whatis("Description: module name and version")
local root = "/software/HDF5/1.12.1-gompi-2021b"
conflict("HDF5")
depends_on("gompi/2021b")
depends_on("zlib/1.2.11-GCCcore-11.2.0")
depends_on("Szip/2.1.1-GCCcore-11.2.0")
setenv("HDF5_DIR", "/software/HDF5/1.12.1-gompi-2021b")
