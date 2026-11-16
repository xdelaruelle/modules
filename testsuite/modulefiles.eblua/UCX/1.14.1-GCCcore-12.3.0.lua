whatis("Description: module name and version")
local root = "/software/UCX/1.14.1-GCCcore-12.3.0"
conflict("UCX")
depends_on("GCCcore/12.3.0")
depends_on("zlib/1.2.13-GCCcore-12.3.0")
depends_on("numactl/2.0.16-GCCcore-12.3.0")
