whatis("Description: module name and version")
local root = "/software/nettle/3.8-GCCcore-11.3.0"
conflict("nettle")
depends_on("GCCcore/11.3.0")
depends_on("GMP/6.2.1-GCCcore-11.3.0")
