whatis("Description: module name and version")
local root = "/software/cURL/7.86.0-GCCcore-12.2.0"
conflict("cURL")
depends_on("GCCcore/12.2.0")
depends_on("zlib/1.2.12-GCCcore-12.2.0")
depends_on("OpenSSL/1.1")
setenv("CURL_INCLUDES", "/software/cURL/7.86.0-GCCcore-12.2.0/include")
