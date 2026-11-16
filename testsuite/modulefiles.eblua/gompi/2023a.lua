whatis("Description: module name and version")
local root = "/software/gompi/2023a"
conflict("gompi")
depends_on("GCC/12.3.0")
depends_on("OpenMPI/4.1.5-GCC-12.3.0")
