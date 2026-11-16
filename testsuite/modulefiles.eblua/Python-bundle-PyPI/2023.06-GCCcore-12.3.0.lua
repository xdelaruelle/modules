whatis("Description: module name and version")
local root = "/software/Python-bundle-PyPI/2023.06-GCCcore-12.3.0"
conflict("Python-bundle-PyPI")
depends_on("GCCcore/12.3.0")
depends_on("Python/3.11.3-GCCcore-12.3.0")
depends_on("cryptography/41.0.1-GCCcore-12.3.0")
depends_on("virtualenv/20.23.1-GCCcore-12.3.0")
