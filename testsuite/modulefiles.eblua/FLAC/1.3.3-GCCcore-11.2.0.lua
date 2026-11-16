whatis("Description: module name and version")
local root = "/software/FLAC/1.3.3-GCCcore-11.2.0"
conflict("FLAC")
depends_on("GCCcore/11.2.0")
depends_on("libogg/1.3.5-GCCcore-11.2.0")
