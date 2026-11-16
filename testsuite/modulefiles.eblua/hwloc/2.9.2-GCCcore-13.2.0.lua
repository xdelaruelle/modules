whatis("Description: module name and version")
local root = "/software/hwloc/2.9.2-GCCcore-13.2.0"
conflict("hwloc")
depends_on("GCCcore/13.2.0")
depends_on("numactl/2.0.16-GCCcore-13.2.0")
depends_on("libxml2/2.11.5-GCCcore-13.2.0")
depends_on("libpciaccess/0.17-GCCcore-13.2.0")
