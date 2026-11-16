whatis("Description: module name and version")
local root = "/software/SWIG/4.1.1-GCCcore-13.2.0"
conflict("SWIG")
depends_on("GCCcore/13.2.0")
depends_on("zlib/1.2.13-GCCcore-13.2.0")
depends_on("PCRE2/10.42-GCCcore-13.2.0")
