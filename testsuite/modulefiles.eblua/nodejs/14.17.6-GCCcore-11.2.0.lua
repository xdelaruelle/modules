whatis("Description: module name and version")
local root = "/software/nodejs/14.17.6-GCCcore-11.2.0"
conflict("nodejs")
depends_on("GCCcore/11.2.0")
depends_on("ICU/69.1-GCCcore-11.2.0")
depends_on("OpenSSL/1.1")
