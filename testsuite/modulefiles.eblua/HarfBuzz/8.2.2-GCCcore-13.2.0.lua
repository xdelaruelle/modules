whatis("Description: module name and version")
local root = "/software/HarfBuzz/8.2.2-GCCcore-13.2.0"
conflict("HarfBuzz")
depends_on("GCCcore/13.2.0")
depends_on("GLib/2.78.1-GCCcore-13.2.0")
depends_on("ICU/74.1-GCCcore-13.2.0")
depends_on("cairo/1.18.0-GCCcore-13.2.0")
depends_on("freetype/2.13.2-GCCcore-13.2.0")
