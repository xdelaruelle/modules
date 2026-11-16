whatis("Description: module name and version")
local root = "/software/gompi/2021b"
conflict("gompi")
depends_on("GCC/11.2.0")
depends_on("OpenMPI/4.1.1-GCC-11.2.0")
