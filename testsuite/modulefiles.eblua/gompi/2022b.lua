whatis("Description: module name and version")
local root = "/software/gompi/2022b"
conflict("gompi")
depends_on("GCC/12.2.0")
depends_on("OpenMPI/4.1.4-GCC-12.2.0")
