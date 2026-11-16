whatis("Description: module name and version")
local root = "/software/nettle/3.8.1-GCCcore-12.2.0"
conflict("nettle")
depends_on("GCCcore/12.2.0")
depends_on("GMP/6.2.1-GCCcore-12.2.0")
