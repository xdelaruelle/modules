whatis("Description: module name and version")
local root = "/software/PMIx/4.2.6-GCCcore-13.2.0"
conflict("PMIx")
depends_on("GCCcore/13.2.0")
depends_on("libevent/2.1.12-GCCcore-13.2.0")
depends_on("zlib/1.2.13-GCCcore-13.2.0")
depends_on("hwloc/2.9.2-GCCcore-13.2.0")
