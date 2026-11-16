whatis("Description: module name and version")
local root = "/software/arrow-R/16.1.0-foss-2023b-R-4.4.1"
conflict("arrow-R")
depends_on("foss/2023b")
depends_on("R/4.4.1-gfbf-2023b")
depends_on("R-bundle-CRAN/2024.06-foss-2023b")
depends_on("Arrow/16.1.0-gfbf-2023b")
prepend_path("R_LIBS_SITE", pathJoin(root, ""))
