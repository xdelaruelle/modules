whatis("Description: module name and version")
local root = "/software/HarfBuzz/2.8.2-GCCcore-11.2.0"
conflict("HarfBuzz")
depends_on("GCCcore/11.2.0")
depends_on("GLib/2.69.1-GCCcore-11.2.0")
depends_on("ICU/69.1-GCCcore-11.2.0")
depends_on("cairo/1.16.0-GCCcore-11.2.0")
depends_on("freetype/2.11.0-GCCcore-11.2.0")
