whatis("Description: module name and version")
local root = "/software/FLAC/1.4.2-GCCcore-12.3.0"
conflict("FLAC")
depends_on("GCCcore/12.3.0")
depends_on("libogg/1.3.5-GCCcore-12.3.0")
