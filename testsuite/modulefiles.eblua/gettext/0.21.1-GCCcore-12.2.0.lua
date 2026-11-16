whatis("Description: module name and version")
local root = "/software/gettext/0.21.1-GCCcore-12.2.0"
conflict("gettext")
depends_on("GCCcore/12.2.0")
depends_on("libxml2/2.10.3-GCCcore-12.2.0")
depends_on("ncurses/6.3-GCCcore-12.2.0")
