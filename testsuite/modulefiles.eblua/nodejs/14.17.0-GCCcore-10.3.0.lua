whatis("Description: module name and version")
local root = "/software/nodejs/14.17.0-GCCcore-10.3.0"
conflict("nodejs")
depends_on("GCCcore/10.3.0")
depends_on("ICU/69.1-GCCcore-10.3.0")
depends_on("OpenSSL/1.1")
