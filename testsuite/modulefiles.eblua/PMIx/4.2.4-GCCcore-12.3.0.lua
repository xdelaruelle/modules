whatis("Description: module name and version")
local root = "/software/PMIx/4.2.4-GCCcore-12.3.0"
conflict("PMIx")
depends_on("GCCcore/12.3.0")
depends_on("libevent/2.1.12-GCCcore-12.3.0")
depends_on("zlib/1.2.13-GCCcore-12.3.0")
depends_on("hwloc/2.9.1-GCCcore-12.3.0")
