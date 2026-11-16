whatis("Description: module name and version")
local root = "/software/gompi/2022a"
conflict("gompi")
depends_on("GCC/11.3.0")
depends_on("OpenMPI/4.1.4-GCC-11.3.0")
