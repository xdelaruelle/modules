whatis("Description: module name and version")
local root = "/software/PCRE/8.45-GCCcore-12.2.0"
conflict("PCRE")
depends_on("GCCcore/12.2.0")
depends_on("bzip2/1.0.8-GCCcore-12.2.0")
depends_on("zlib/1.2.12-GCCcore-12.2.0")
