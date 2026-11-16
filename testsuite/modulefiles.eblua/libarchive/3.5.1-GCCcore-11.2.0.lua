whatis("Description: module name and version")
local root = "/software/libarchive/3.5.1-GCCcore-11.2.0"
conflict("libarchive")
depends_on("GCCcore/11.2.0")
depends_on("zlib/1.2.11-GCCcore-11.2.0")
depends_on("XZ/5.2.5-GCCcore-11.2.0")
depends_on("libxml2/2.9.10-GCCcore-11.2.0")
depends_on("OpenSSL/1.1")
depends_on("zstd/1.5.0-GCCcore-11.2.0")
