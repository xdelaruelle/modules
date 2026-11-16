whatis("Description: module name and version")
local root = "/software/Meson/1.1.1-GCCcore-12.3.0"
conflict("Meson")
depends_on("GCCcore/12.3.0")
depends_on("Python/3.11.3-GCCcore-12.3.0")
depends_on("Ninja/1.11.1-GCCcore-12.3.0")
