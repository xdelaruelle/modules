whatis("Description: module name and version")
local root = "/software/poetry/1.6.1-GCCcore-13.2.0"
conflict("poetry")
depends_on("GCCcore/13.2.0")
depends_on("Python/3.11.5-GCCcore-13.2.0")
depends_on("hatchling/1.18.0-GCCcore-13.2.0")
depends_on("cryptography/41.0.5-GCCcore-13.2.0")
depends_on("virtualenv/20.24.6-GCCcore-13.2.0")
