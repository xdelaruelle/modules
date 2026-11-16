whatis("Description: module name and version")
local root = "/software/SQLite/3.38.3-GCCcore-11.3.0"
conflict("SQLite")
depends_on("GCCcore/11.3.0")
depends_on("libreadline/8.1.2-GCCcore-11.3.0")
depends_on("Tcl/8.6.12-GCCcore-11.3.0")
