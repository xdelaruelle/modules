whatis("Description: module name and version")
local root = "/software/nodejs/18.17.1-GCCcore-12.3.0"
conflict("nodejs")
depends_on("GCCcore/12.3.0")
depends_on("ICU/73.2-GCCcore-12.3.0")
depends_on("OpenSSL/1.1")
