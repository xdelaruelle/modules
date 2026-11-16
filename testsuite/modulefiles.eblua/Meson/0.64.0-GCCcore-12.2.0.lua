whatis("Description: module name and version")
local root = "/software/Meson/0.64.0-GCCcore-12.2.0"
conflict("Meson")
depends_on("GCCcore/12.2.0")
depends_on("Python/3.10.8-GCCcore-12.2.0")
depends_on("Ninja/1.11.1-GCCcore-12.2.0")
