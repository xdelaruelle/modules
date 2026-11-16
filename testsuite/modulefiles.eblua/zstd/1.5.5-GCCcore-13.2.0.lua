whatis("Description: module name and version")
local root = "/software/zstd/1.5.5-GCCcore-13.2.0"
conflict("zstd")
depends_on("GCCcore/13.2.0")
depends_on("zlib/1.2.13-GCCcore-13.2.0")
depends_on("gzip/1.13-GCCcore-13.2.0")
depends_on("XZ/5.4.4-GCCcore-13.2.0")
depends_on("lz4/1.9.4-GCCcore-13.2.0")
