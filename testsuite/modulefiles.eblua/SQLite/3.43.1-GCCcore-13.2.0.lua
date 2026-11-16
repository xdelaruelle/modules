whatis("Description: module name and version")
local root = "/software/SQLite/3.43.1-GCCcore-13.2.0"
conflict("SQLite")
depends_on("GCCcore/13.2.0")
depends_on("libreadline/8.2-GCCcore-13.2.0")
depends_on("Tcl/8.6.13-GCCcore-13.2.0")
