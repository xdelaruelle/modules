whatis("Description: module name and version")
local root = "/software/pkgconf/1.9.3-GCCcore-12.2.0"
conflict("pkgconf")
depends_on("GCCcore/12.2.0")
setenv("PKG_CONFIG", "/software/pkgconf/1.9.3-GCCcore-12.2.0/bin/pkgconf")
