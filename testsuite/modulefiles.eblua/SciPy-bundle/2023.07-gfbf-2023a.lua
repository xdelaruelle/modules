whatis("Description: module name and version")
local root = "/software/SciPy-bundle/2023.07-gfbf-2023a"
conflict("SciPy-bundle")
depends_on("gfbf/2023a")
depends_on("Python/3.11.3-GCCcore-12.3.0")
depends_on("Python-bundle-PyPI/2023.06-GCCcore-12.3.0")
depends_on("pybind11/2.11.1-GCCcore-12.3.0")
