whatis("Description: module name and version")
local root = "/software/libxml2/2.11.5-GCCcore-13.2.0"
conflict("libxml2")
depends_on("GCCcore/13.2.0")
depends_on("XZ/5.4.4-GCCcore-13.2.0")
depends_on("zlib/1.2.13-GCCcore-13.2.0")
prepend_path("CPATH", pathJoin(root, "include/libxml2"))
