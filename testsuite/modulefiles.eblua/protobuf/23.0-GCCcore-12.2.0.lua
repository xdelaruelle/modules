whatis("Description: module name and version")
local root = "/software/protobuf/23.0-GCCcore-12.2.0"
conflict("protobuf")
depends_on("GCCcore/12.2.0")
depends_on("Abseil/20230125.2-GCCcore-12.2.0")
