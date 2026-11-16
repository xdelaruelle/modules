whatis("Description: module name and version")
local root = "/software/UCX/1.10.0-GCCcore-10.3.0"
conflict("UCX")
depends_on("GCCcore/10.3.0")
depends_on("zlib/1.2.11-GCCcore-10.3.0")
depends_on("numactl/2.0.14-GCCcore-10.3.0")
