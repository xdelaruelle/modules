whatis("Description: module name and version")
local root = "/software/libarchive/3.7.2-GCCcore-13.2.0"
conflict("libarchive")
depends_on("GCCcore/13.2.0")
depends_on("zlib/1.2.13-GCCcore-13.2.0")
depends_on("XZ/5.4.4-GCCcore-13.2.0")
depends_on("libxml2/2.11.5-GCCcore-13.2.0")
depends_on("OpenSSL/1.1")
depends_on("zstd/1.5.5-GCCcore-13.2.0")
