whatis("Description: module name and version")
local root = "/software/UCX/1.15.0-GCCcore-13.2.0"
conflict("UCX")
depends_on("GCCcore/13.2.0")
depends_on("zlib/1.2.13-GCCcore-13.2.0")
depends_on("numactl/2.0.16-GCCcore-13.2.0")
