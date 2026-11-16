whatis("Description: module name and version")
local root = "/software/Pango/1.50.12-GCCcore-12.2.0"
conflict("Pango")
depends_on("GCCcore/12.2.0")
depends_on("X11/20221110-GCCcore-12.2.0")
depends_on("GLib/2.75.0-GCCcore-12.2.0")
depends_on("cairo/1.17.4-GCCcore-12.2.0")
depends_on("HarfBuzz/5.3.1-GCCcore-12.2.0")
depends_on("FriBidi/1.0.12-GCCcore-12.2.0")
