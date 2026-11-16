whatis("Description: module name and version")
local root = "/software/scikit-build/0.17.6-GCCcore-12.3.0"
conflict("scikit-build")
depends_on("GCCcore/12.3.0")
depends_on("Python/3.11.3-GCCcore-12.3.0")
