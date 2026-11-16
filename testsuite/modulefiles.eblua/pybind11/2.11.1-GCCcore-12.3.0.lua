whatis("Description: module name and version")
local root = "/software/pybind11/2.11.1-GCCcore-12.3.0"
conflict("pybind11")
depends_on("GCCcore/12.3.0")
depends_on("Python/3.11.3-GCCcore-12.3.0")
