whatis("Description: module name and version")
local root = "/software/cURL/7.76.0-GCCcore-10.3.0"
conflict("cURL")
depends_on("GCCcore/10.3.0")
depends_on("zlib/1.2.11-GCCcore-10.3.0")
depends_on("OpenSSL/1.1")
setenv("CURL_INCLUDES", "/software/cURL/7.76.0-GCCcore-10.3.0/include")
