whatis("Description: module name and version")
local root = "/software/libfabric/1.15.1-GCCcore-11.3.0"
conflict("libfabric")
depends_on("GCCcore/11.3.0")
depends_on("numactl/2.0.14-GCCcore-11.3.0")
