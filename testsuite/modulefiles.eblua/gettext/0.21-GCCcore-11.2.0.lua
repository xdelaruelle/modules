whatis("Description: module name and version")
local root = "/software/gettext/0.21-GCCcore-11.2.0"
conflict("gettext")
depends_on("GCCcore/11.2.0")
depends_on("libxml2/2.9.10-GCCcore-11.2.0")
depends_on("ncurses/6.2-GCCcore-11.2.0")
