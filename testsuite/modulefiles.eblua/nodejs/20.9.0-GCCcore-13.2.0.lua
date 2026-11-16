whatis("Description: module name and version")
local root = "/software/nodejs/20.9.0-GCCcore-13.2.0"
conflict("nodejs")
depends_on("GCCcore/13.2.0")
depends_on("ICU/74.1-GCCcore-13.2.0")
depends_on("OpenSSL/1.1")
