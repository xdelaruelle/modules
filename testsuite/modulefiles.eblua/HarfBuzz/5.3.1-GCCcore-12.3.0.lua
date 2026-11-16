whatis("Description: module name and version")
local root = "/software/HarfBuzz/5.3.1-GCCcore-12.3.0"
conflict("HarfBuzz")
depends_on("GCCcore/12.3.0")
depends_on("GLib/2.77.1-GCCcore-12.3.0")
depends_on("ICU/73.2-GCCcore-12.3.0")
depends_on("cairo/1.17.8-GCCcore-12.3.0")
depends_on("freetype/2.13.0-GCCcore-12.3.0")
