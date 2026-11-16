whatis("Description: module name and version")
local root = "/software/libxml2/2.10.3-GCCcore-12.2.0"
conflict("libxml2")
depends_on("GCCcore/12.2.0")
depends_on("XZ/5.2.7-GCCcore-12.2.0")
depends_on("zlib/1.2.12-GCCcore-12.2.0")
prepend_path("CPATH", pathJoin(root, "include/libxml2"))
