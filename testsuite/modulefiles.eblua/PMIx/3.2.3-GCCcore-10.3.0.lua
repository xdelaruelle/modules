whatis("Description: module name and version")
local root = "/software/PMIx/3.2.3-GCCcore-10.3.0"
conflict("PMIx")
depends_on("GCCcore/10.3.0")
depends_on("libevent/2.1.12-GCCcore-10.3.0")
depends_on("zlib/1.2.11-GCCcore-10.3.0")
depends_on("hwloc/2.4.1-GCCcore-10.3.0")
