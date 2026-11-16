whatis("Description: module name and version")
local root = "/software/Meson/0.62.1-GCCcore-11.3.0"
conflict("Meson")
depends_on("GCCcore/11.3.0")
depends_on("Python/3.10.4-GCCcore-11.3.0")
depends_on("Ninja/1.10.2-GCCcore-11.3.0")
