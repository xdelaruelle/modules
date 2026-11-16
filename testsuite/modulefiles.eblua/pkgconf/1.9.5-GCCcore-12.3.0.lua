whatis("Description: module name and version")
local root = "/software/pkgconf/1.9.5-GCCcore-12.3.0"
conflict("pkgconf")
depends_on("GCCcore/12.3.0")
setenv("PKG_CONFIG", "/software/pkgconf/1.9.5-GCCcore-12.3.0/bin/pkgconf")
