whatis("Description: module name and version")
local root = "/software/arrow-R/8.0.0-foss-2022a-R-4.2.1"
conflict("arrow-R")
depends_on("foss/2022a")
depends_on("R/4.2.1-foss-2022a")
depends_on("Arrow/8.0.0-foss-2022a")
prepend_path("R_LIBS_SITE", pathJoin(root, ""))
