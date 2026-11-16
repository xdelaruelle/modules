whatis("Description: module name and version")
local root = "/software/Meson/0.58.0-GCCcore-10.3.0"
conflict("Meson")
depends_on("GCCcore/10.3.0")
depends_on("Python/3.9.5-GCCcore-10.3.0")
depends_on("Ninja/1.10.2-GCCcore-10.3.0")
