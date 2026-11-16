whatis("Description: module name and version")
local root = "/software/arrow-R/14.0.1-foss-2023a-R-4.3.2"
conflict("arrow-R")
depends_on("foss/2023a")
depends_on("R/4.3.2-gfbf-2023a")
depends_on("R-bundle-CRAN/2023.12-foss-2023a")
depends_on("Arrow/14.0.1-gfbf-2023a")
prepend_path("R_LIBS_SITE", pathJoin(root, ""))
