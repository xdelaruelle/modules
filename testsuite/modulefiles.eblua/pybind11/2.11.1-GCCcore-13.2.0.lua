whatis("Description: module name and version")
local root = "/software/pybind11/2.11.1-GCCcore-13.2.0"
conflict("pybind11")
depends_on("GCCcore/13.2.0")
depends_on("Python/3.11.5-GCCcore-13.2.0")
