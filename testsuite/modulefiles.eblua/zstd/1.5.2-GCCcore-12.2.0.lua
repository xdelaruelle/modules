whatis("Description: module name and version")
local root = "/software/zstd/1.5.2-GCCcore-12.2.0"
conflict("zstd")
depends_on("GCCcore/12.2.0")
depends_on("zlib/1.2.12-GCCcore-12.2.0")
depends_on("gzip/1.12-GCCcore-12.2.0")
depends_on("XZ/5.2.7-GCCcore-12.2.0")
depends_on("lz4/1.9.4-GCCcore-12.2.0")
