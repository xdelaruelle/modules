whatis("Description: module name and version")
local root = "/software/cURL/7.78.0-GCCcore-11.2.0"
conflict("cURL")
depends_on("GCCcore/11.2.0")
depends_on("zlib/1.2.11-GCCcore-11.2.0")
depends_on("OpenSSL/1.1")
setenv("CURL_INCLUDES", "/software/cURL/7.78.0-GCCcore-11.2.0/include")
