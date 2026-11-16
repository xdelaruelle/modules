whatis("Description: module name and version")
local root = "/software/libsndfile/1.2.0-GCCcore-12.2.0"
conflict("libsndfile")
depends_on("GCCcore/12.2.0")
depends_on("FLAC/1.4.2-GCCcore-12.2.0")
depends_on("libvorbis/1.3.7-GCCcore-12.2.0")
depends_on("libopus/1.3.1-GCCcore-12.2.0")
depends_on("LAME/3.100-GCCcore-12.2.0")
