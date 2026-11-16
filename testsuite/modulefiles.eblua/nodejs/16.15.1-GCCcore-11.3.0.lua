whatis("Description: module name and version")
local root = "/software/nodejs/16.15.1-GCCcore-11.3.0"
conflict("nodejs")
depends_on("GCCcore/11.3.0")
depends_on("ICU/71.1-GCCcore-11.3.0")
depends_on("OpenSSL/1.1")
