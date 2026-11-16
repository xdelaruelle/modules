whatis("Description: module name and version")
local root = "/software/poetry/1.5.1-GCCcore-12.3.0"
conflict("poetry")
depends_on("GCCcore/12.3.0")
depends_on("Python/3.11.3-GCCcore-12.3.0")
depends_on("hatchling/1.18.0-GCCcore-12.3.0")
depends_on("cryptography/41.0.1-GCCcore-12.3.0")
depends_on("virtualenv/20.23.1-GCCcore-12.3.0")
