whatis("Description: module name and version")
local root = "/software/Automake/1.16.5-GCCcore-11.3.0"
conflict("Automake")
depends_on("GCCcore/11.3.0")
depends_on("Autoconf/2.71-GCCcore-11.3.0")
depends_on("Perl/5.34.1-GCCcore-11.3.0")
