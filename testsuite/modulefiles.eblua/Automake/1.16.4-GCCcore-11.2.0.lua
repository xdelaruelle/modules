whatis("Description: module name and version")
local root = "/software/Automake/1.16.4-GCCcore-11.2.0"
conflict("Automake")
depends_on("GCCcore/11.2.0")
depends_on("Autoconf/2.71-GCCcore-11.2.0")
depends_on("Perl/5.34.0-GCCcore-11.2.0")
