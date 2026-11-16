whatis("Description: module name and version")
local root = "/software/libfabric/1.16.1-GCCcore-12.2.0"
conflict("libfabric")
depends_on("GCCcore/12.2.0")
depends_on("numactl/2.0.16-GCCcore-12.2.0")
