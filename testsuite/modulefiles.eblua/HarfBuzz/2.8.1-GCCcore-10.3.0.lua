whatis("Description: module name and version")
local root = "/software/HarfBuzz/2.8.1-GCCcore-10.3.0"
conflict("HarfBuzz")
depends_on("GCCcore/10.3.0")
depends_on("GLib/2.68.2-GCCcore-10.3.0")
depends_on("ICU/69.1-GCCcore-10.3.0")
depends_on("cairo/1.16.0-GCCcore-10.3.0")
depends_on("freetype/2.10.4-GCCcore-10.3.0")
