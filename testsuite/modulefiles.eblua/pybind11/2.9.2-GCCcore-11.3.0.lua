whatis("Description: module name and version")
local root = "/software/pybind11/2.9.2-GCCcore-11.3.0"
conflict("pybind11")
depends_on("GCCcore/11.3.0")
depends_on("Python/3.10.4-GCCcore-11.3.0")
