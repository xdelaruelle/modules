whatis("Description: module name and version")
local root = "/software/cryptography/41.0.1-GCCcore-12.3.0"
conflict("cryptography")
depends_on("GCCcore/12.3.0")
depends_on("Python/3.11.3-GCCcore-12.3.0")
depends_on("cffi/1.15.1-GCCcore-12.3.0")
