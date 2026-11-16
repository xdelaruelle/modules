whatis("Description: module name and version")
local root = "/software/libarchive/3.6.1-GCCcore-11.3.0"
conflict("libarchive")
depends_on("GCCcore/11.3.0")
depends_on("zlib/1.2.12-GCCcore-11.3.0")
depends_on("XZ/5.2.5-GCCcore-11.3.0")
depends_on("libxml2/2.9.13-GCCcore-11.3.0")
depends_on("OpenSSL/1.1")
depends_on("zstd/1.5.2-GCCcore-11.3.0")
