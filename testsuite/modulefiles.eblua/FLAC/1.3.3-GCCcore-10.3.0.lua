whatis("Description: module name and version")
local root = "/software/FLAC/1.3.3-GCCcore-10.3.0"
conflict("FLAC")
depends_on("GCCcore/10.3.0")
depends_on("libogg/1.3.4-GCCcore-10.3.0")
