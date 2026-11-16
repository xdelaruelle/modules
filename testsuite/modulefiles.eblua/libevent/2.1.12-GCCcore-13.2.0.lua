whatis("Description: module name and version")
local root = "/software/libevent/2.1.12-GCCcore-13.2.0"
conflict("libevent")
depends_on("GCCcore/13.2.0")
depends_on("zlib/1.2.13-GCCcore-13.2.0")
depends_on("OpenSSL/1.1")
