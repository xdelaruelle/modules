whatis("Description: module name and version")
local root = "/software/PMIx/4.1.2-GCCcore-11.3.0"
conflict("PMIx")
depends_on("GCCcore/11.3.0")
depends_on("libevent/2.1.12-GCCcore-11.3.0")
depends_on("zlib/1.2.12-GCCcore-11.3.0")
depends_on("hwloc/2.7.1-GCCcore-11.3.0")
