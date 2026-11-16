whatis("Description: module name and version")
local root = "/software/libxml2/2.9.10-GCCcore-10.3.0"
conflict("libxml2")
depends_on("GCCcore/10.3.0")
depends_on("XZ/5.2.5-GCCcore-10.3.0")
depends_on("zlib/1.2.11-GCCcore-10.3.0")
prepend_path("CPATH", pathJoin(root, "include/libxml2"))
