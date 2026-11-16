whatis("Description: module name and version")
local root = "/software/hwloc/2.8.0-GCCcore-12.2.0"
conflict("hwloc")
depends_on("GCCcore/12.2.0")
depends_on("numactl/2.0.16-GCCcore-12.2.0")
depends_on("libxml2/2.10.3-GCCcore-12.2.0")
depends_on("libpciaccess/0.17-GCCcore-12.2.0")
