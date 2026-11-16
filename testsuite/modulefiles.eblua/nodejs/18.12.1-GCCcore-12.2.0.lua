whatis("Description: module name and version")
local root = "/software/nodejs/18.12.1-GCCcore-12.2.0"
conflict("nodejs")
depends_on("GCCcore/12.2.0")
depends_on("ICU/72.1-GCCcore-12.2.0")
depends_on("OpenSSL/1.1")
