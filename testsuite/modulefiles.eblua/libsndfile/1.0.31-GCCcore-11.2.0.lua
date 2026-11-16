whatis("Description: module name and version")
local root = "/software/libsndfile/1.0.31-GCCcore-11.2.0"
conflict("libsndfile")
depends_on("GCCcore/11.2.0")
depends_on("FLAC/1.3.3-GCCcore-11.2.0")
depends_on("libvorbis/1.3.7-GCCcore-11.2.0")
