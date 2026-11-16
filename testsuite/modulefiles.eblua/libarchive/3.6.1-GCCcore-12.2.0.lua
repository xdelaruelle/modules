whatis("Description: module name and version")
local root = "/software/libarchive/3.6.1-GCCcore-12.2.0"
conflict("libarchive")
depends_on("GCCcore/12.2.0")
depends_on("zlib/1.2.12-GCCcore-12.2.0")
depends_on("XZ/5.2.7-GCCcore-12.2.0")
depends_on("libxml2/2.10.3-GCCcore-12.2.0")
depends_on("OpenSSL/1.1")
depends_on("zstd/1.5.2-GCCcore-12.2.0")
