whatis("Description: module name and version")
local root = "/software/arrow-R/11.0.0.3-foss-2022b-R-4.2.2"
conflict("arrow-R")
depends_on("foss/2022b")
depends_on("R/4.2.2-foss-2022b")
depends_on("Arrow/11.0.0-gfbf-2022b")
prepend_path("R_LIBS_SITE", pathJoin(root, ""))
