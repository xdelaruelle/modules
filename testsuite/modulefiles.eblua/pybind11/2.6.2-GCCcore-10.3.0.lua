whatis("Description: module name and version")
local root = "/software/pybind11/2.6.2-GCCcore-10.3.0"
conflict("pybind11")
depends_on("GCCcore/10.3.0")
depends_on("Python/3.9.5-GCCcore-10.3.0")
