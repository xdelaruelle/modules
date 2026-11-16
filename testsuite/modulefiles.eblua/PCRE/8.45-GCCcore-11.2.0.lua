whatis("Description: module name and version")
local root = "/software/PCRE/8.45-GCCcore-11.2.0"
conflict("PCRE")
depends_on("GCCcore/11.2.0")
depends_on("bzip2/1.0.8-GCCcore-11.2.0")
depends_on("zlib/1.2.11-GCCcore-11.2.0")
