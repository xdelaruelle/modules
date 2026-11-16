whatis("Description: module name and version")
local root = "/software/PCRE/8.45-GCCcore-11.3.0"
conflict("PCRE")
depends_on("GCCcore/11.3.0")
depends_on("bzip2/1.0.8-GCCcore-11.3.0")
depends_on("zlib/1.2.12-GCCcore-11.3.0")
