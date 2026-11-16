whatis("Description: module name and version")
local root = "/software/MPFR/4.2.0-GCCcore-12.3.0"
conflict("MPFR")
depends_on("GCCcore/12.3.0")
depends_on("GMP/6.2.1-GCCcore-12.3.0")
