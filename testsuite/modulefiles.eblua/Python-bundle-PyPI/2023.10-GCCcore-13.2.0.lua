whatis("Description: module name and version")
local root = "/software/Python-bundle-PyPI/2023.10-GCCcore-13.2.0"
conflict("Python-bundle-PyPI")
depends_on("GCCcore/13.2.0")
depends_on("Python/3.11.5-GCCcore-13.2.0")
depends_on("cryptography/41.0.5-GCCcore-13.2.0")
depends_on("virtualenv/20.24.6-GCCcore-13.2.0")
