whatis("Description: module name and version")
local root = "/software/gettext/0.22-GCCcore-13.2.0"
conflict("gettext")
depends_on("GCCcore/13.2.0")
depends_on("libxml2/2.11.5-GCCcore-13.2.0")
depends_on("ncurses/6.4-GCCcore-13.2.0")
depends_on("libiconv/1.17-GCCcore-13.2.0")
