whatis("Description: module name and version")
local root = "/software/PMIx/4.1.0-GCCcore-11.2.0"
conflict("PMIx")
depends_on("GCCcore/11.2.0")
depends_on("libevent/2.1.12-GCCcore-11.2.0")
depends_on("zlib/1.2.11-GCCcore-11.2.0")
depends_on("hwloc/2.5.0-GCCcore-11.2.0")
depends_on("libfabric/1.13.2-GCCcore-11.2.0")
