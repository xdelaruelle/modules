whatis("Description: module name and version")
local root = "/software/libxml2/2.11.4-GCCcore-12.3.0"
conflict("libxml2")
depends_on("GCCcore/12.3.0")
depends_on("XZ/5.4.2-GCCcore-12.3.0")
depends_on("zlib/1.2.13-GCCcore-12.3.0")
prepend_path("CPATH", pathJoin(root, "include/libxml2"))
