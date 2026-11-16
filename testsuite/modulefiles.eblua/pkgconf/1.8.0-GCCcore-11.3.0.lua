whatis("Description: module name and version")
local root = "/software/pkgconf/1.8.0-GCCcore-11.3.0"
conflict("pkgconf")
depends_on("GCCcore/11.3.0")
setenv("PKG_CONFIG", "/software/pkgconf/1.8.0-GCCcore-11.3.0/bin/pkgconf")
