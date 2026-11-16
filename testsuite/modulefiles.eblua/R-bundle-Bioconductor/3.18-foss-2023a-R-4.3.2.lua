whatis("Description: module name and version")
local root = "/software/R-bundle-Bioconductor/3.18-foss-2023a-R-4.3.2"
conflict("R-bundle-Bioconductor")
depends_on("foss/2023a")
depends_on("R/4.3.2-gfbf-2023a")
depends_on("Boost/1.82.0-GCC-12.3.0")
depends_on("GSL/2.7-GCC-12.3.0")
depends_on("R-bundle-CRAN/2023.12-foss-2023a")
depends_on("arrow-R/14.0.1-foss-2023a-R-4.3.2")
