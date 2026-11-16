whatis("Description: module name and version")
local root = "/software/cURL/7.83.0-GCCcore-11.3.0"
conflict("cURL")
depends_on("GCCcore/11.3.0")
depends_on("zlib/1.2.12-GCCcore-11.3.0")
depends_on("OpenSSL/1.1")
setenv("CURL_INCLUDES", "/software/cURL/7.83.0-GCCcore-11.3.0/include")
