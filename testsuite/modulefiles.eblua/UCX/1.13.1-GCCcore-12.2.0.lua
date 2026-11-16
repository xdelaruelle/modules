whatis("Description: module name and version")
local root = "/software/UCX/1.13.1-GCCcore-12.2.0"
conflict("UCX")
depends_on("GCCcore/12.2.0")
depends_on("zlib/1.2.12-GCCcore-12.2.0")
depends_on("numactl/2.0.16-GCCcore-12.2.0")
