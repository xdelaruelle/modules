whatis("Description: module name and version")
local root = "/software/libfabric/1.12.1-GCCcore-10.3.0"
conflict("libfabric")
depends_on("GCCcore/10.3.0")
depends_on("numactl/2.0.14-GCCcore-10.3.0")
