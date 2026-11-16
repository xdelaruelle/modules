whatis("Description: module name and version")
local root = "/software/pkgconf/2.0.3-GCCcore-13.2.0"
conflict("pkgconf")
depends_on("GCCcore/13.2.0")
setenv("PKG_CONFIG", "/software/pkgconf/2.0.3-GCCcore-13.2.0/bin/pkgconf")
