whatis("Description: module name and version")
local root = "/software/cURL/8.3.0-GCCcore-13.2.0"
conflict("cURL")
depends_on("GCCcore/13.2.0")
depends_on("zlib/1.2.13-GCCcore-13.2.0")
depends_on("OpenSSL/1.1")
setenv("CURL_INCLUDES", "/software/cURL/8.3.0-GCCcore-13.2.0/include")
