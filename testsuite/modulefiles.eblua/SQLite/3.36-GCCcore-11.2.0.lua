whatis("Description: module name and version")
local root = "/software/SQLite/3.36-GCCcore-11.2.0"
conflict("SQLite")
depends_on("GCCcore/11.2.0")
depends_on("libreadline/8.1-GCCcore-11.2.0")
depends_on("Tcl/8.6.11-GCCcore-11.2.0")
