whatis("Description: module name and version")
local root = "/software/hwloc/2.4.1-GCCcore-10.3.0"
conflict("hwloc")
depends_on("GCCcore/10.3.0")
depends_on("numactl/2.0.14-GCCcore-10.3.0")
depends_on("libxml2/2.9.10-GCCcore-10.3.0")
depends_on("libpciaccess/0.16-GCCcore-10.3.0")
