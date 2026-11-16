whatis("Description: module name and version")
local root = "/software/pybind11/2.7.1-GCCcore-11.2.0"
conflict("pybind11")
depends_on("GCCcore/11.2.0")
depends_on("Python/3.9.6-GCCcore-11.2.0")
