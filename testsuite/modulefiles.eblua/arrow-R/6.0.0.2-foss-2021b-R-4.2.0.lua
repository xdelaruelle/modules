whatis("Description: module name and version")
local root = "/software/arrow-R/6.0.0.2-foss-2021b-R-4.2.0"
conflict("arrow-R")
depends_on("foss/2021b")
depends_on("R/4.2.0-foss-2021b")
depends_on("Arrow/6.0.0-foss-2021b")
prepend_path("R_LIBS_SITE", pathJoin(root, ""))
