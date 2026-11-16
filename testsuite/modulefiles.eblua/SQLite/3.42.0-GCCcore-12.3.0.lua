whatis("Description: module name and version")
local root = "/software/SQLite/3.42.0-GCCcore-12.3.0"
conflict("SQLite")
depends_on("GCCcore/12.3.0")
depends_on("libreadline/8.2-GCCcore-12.3.0")
depends_on("Tcl/8.6.13-GCCcore-12.3.0")
