whatis("Description: module name and version")
local root = "/software/pybind11/2.10.3-GCCcore-12.2.0"
conflict("pybind11")
depends_on("GCCcore/12.2.0")
depends_on("Python/3.10.8-GCCcore-12.2.0")
