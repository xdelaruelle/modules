whatis("Description: module name and version")
local root = "/software/OpenJPEG/2.5.0-GCCcore-12.2.0"
conflict("OpenJPEG")
depends_on("GCCcore/12.2.0")
depends_on("zlib/1.2.12-GCCcore-12.2.0")
depends_on("libpng/1.6.38-GCCcore-12.2.0")
depends_on("LibTIFF/4.4.0-GCCcore-12.2.0")
