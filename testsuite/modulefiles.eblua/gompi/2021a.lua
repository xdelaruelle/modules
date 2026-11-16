whatis("Description: module name and version")
local root = "/software/gompi/2021a"
conflict("gompi")
depends_on("GCC/10.3.0")
depends_on("OpenMPI/4.1.1-GCC-10.3.0")
