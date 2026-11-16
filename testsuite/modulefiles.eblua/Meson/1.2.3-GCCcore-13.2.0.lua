whatis("Description: module name and version")
local root = "/software/Meson/1.2.3-GCCcore-13.2.0"
conflict("Meson")
depends_on("GCCcore/13.2.0")
depends_on("Python/3.11.5-GCCcore-13.2.0")
depends_on("Ninja/1.11.1-GCCcore-13.2.0")
