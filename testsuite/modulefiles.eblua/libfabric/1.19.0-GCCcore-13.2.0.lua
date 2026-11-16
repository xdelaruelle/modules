whatis("Description: module name and version")
local root = "/software/libfabric/1.19.0-GCCcore-13.2.0"
conflict("libfabric")
depends_on("GCCcore/13.2.0")
depends_on("numactl/2.0.16-GCCcore-13.2.0")
