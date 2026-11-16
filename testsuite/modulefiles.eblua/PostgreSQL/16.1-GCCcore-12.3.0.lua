whatis("Description: module name and version")
local root = "/software/PostgreSQL/16.1-GCCcore-12.3.0"
conflict("PostgreSQL")
depends_on("GCCcore/12.3.0")
depends_on("libreadline/8.2-GCCcore-12.3.0")
depends_on("zlib/1.2.13-GCCcore-12.3.0")
depends_on("OpenSSL/1.1")
