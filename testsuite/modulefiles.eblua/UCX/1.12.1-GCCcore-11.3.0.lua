whatis("Description: module name and version")
local root = "/software/UCX/1.12.1-GCCcore-11.3.0"
conflict("UCX")
depends_on("GCCcore/11.3.0")
depends_on("zlib/1.2.12-GCCcore-11.3.0")
depends_on("numactl/2.0.14-GCCcore-11.3.0")
