whatis("Description: module name and version")
local root = "/software/PMIx/4.2.2-GCCcore-12.2.0"
conflict("PMIx")
depends_on("GCCcore/12.2.0")
depends_on("libevent/2.1.12-GCCcore-12.2.0")
depends_on("zlib/1.2.12-GCCcore-12.2.0")
depends_on("hwloc/2.8.0-GCCcore-12.2.0")
