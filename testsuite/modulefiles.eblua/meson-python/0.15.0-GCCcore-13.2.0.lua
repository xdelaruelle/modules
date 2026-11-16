whatis("Description: module name and version")
local root = "/software/meson-python/0.15.0-GCCcore-13.2.0"
conflict("meson-python")
depends_on("GCCcore/13.2.0")
depends_on("Python/3.11.5-GCCcore-13.2.0")
depends_on("Python-bundle-PyPI/2023.10-GCCcore-13.2.0")
depends_on("Meson/1.2.3-GCCcore-13.2.0")
