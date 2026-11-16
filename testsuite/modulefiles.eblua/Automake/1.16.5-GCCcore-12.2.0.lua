whatis("Description: module name and version")
local root = "/software/Automake/1.16.5-GCCcore-12.2.0"
conflict("Automake")
depends_on("GCCcore/12.2.0")
depends_on("Autoconf/2.71-GCCcore-12.2.0")
depends_on("Perl/5.36.0-GCCcore-12.2.0")
