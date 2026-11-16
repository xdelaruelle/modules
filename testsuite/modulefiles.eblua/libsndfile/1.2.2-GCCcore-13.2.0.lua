whatis("Description: module name and version")
local root = "/software/libsndfile/1.2.2-GCCcore-13.2.0"
conflict("libsndfile")
depends_on("GCCcore/13.2.0")
depends_on("FLAC/1.4.3-GCCcore-13.2.0")
depends_on("libvorbis/1.3.7-GCCcore-13.2.0")
depends_on("libopus/1.5.2-GCCcore-13.2.0")
depends_on("LAME/3.100-GCCcore-13.2.0")
