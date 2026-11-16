whatis("Description: module name and version")
local root = "/software/SQLite/3.39.4-GCCcore-12.2.0"
conflict("SQLite")
depends_on("GCCcore/12.2.0")
depends_on("libreadline/8.2-GCCcore-12.2.0")
depends_on("Tcl/8.6.12-GCCcore-12.2.0")
