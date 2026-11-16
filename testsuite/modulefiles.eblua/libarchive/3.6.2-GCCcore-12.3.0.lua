whatis("Description: module name and version")
local root = "/software/libarchive/3.6.2-GCCcore-12.3.0"
conflict("libarchive")
depends_on("GCCcore/12.3.0")
depends_on("zlib/1.2.13-GCCcore-12.3.0")
depends_on("XZ/5.4.2-GCCcore-12.3.0")
depends_on("libxml2/2.11.4-GCCcore-12.3.0")
depends_on("OpenSSL/1.1")
depends_on("zstd/1.5.5-GCCcore-12.3.0")
