whatis("Description: module name and version")
local root = "/software/HarfBuzz/5.3.1-GCCcore-12.2.0"
conflict("HarfBuzz")
depends_on("GCCcore/12.2.0")
depends_on("GLib/2.75.0-GCCcore-12.2.0")
depends_on("ICU/72.1-GCCcore-12.2.0")
depends_on("cairo/1.17.4-GCCcore-12.2.0")
depends_on("freetype/2.12.1-GCCcore-12.2.0")
