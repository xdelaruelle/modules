whatis("Description: module name and version")
local root = "/software/OpenJPEG/2.5.0-GCCcore-11.3.0"
conflict("OpenJPEG")
depends_on("GCCcore/11.3.0")
depends_on("zlib/1.2.12-GCCcore-11.3.0")
depends_on("libpng/1.6.37-GCCcore-11.3.0")
depends_on("LibTIFF/4.3.0-GCCcore-11.3.0")
