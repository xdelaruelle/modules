whatis("Description: module name and version")
local root = "/software/Meson/0.58.2-GCCcore-11.2.0"
conflict("Meson")
depends_on("GCCcore/11.2.0")
depends_on("Python/3.9.6-GCCcore-11.2.0")
depends_on("Ninja/1.10.2-GCCcore-11.2.0")
