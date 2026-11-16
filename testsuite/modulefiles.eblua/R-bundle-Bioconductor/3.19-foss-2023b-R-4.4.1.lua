whatis("Description: module name and version")
local root = "/software/R-bundle-Bioconductor/3.19-foss-2023b-R-4.4.1"
conflict("R-bundle-Bioconductor")
depends_on("foss/2023b")
depends_on("R/4.4.1-gfbf-2023b")
depends_on("Boost/1.83.0-GCC-13.2.0")
depends_on("GSL/2.7-GCC-13.2.0")
depends_on("R-bundle-CRAN/2024.06-foss-2023b")
depends_on("arrow-R/16.1.0-foss-2023b-R-4.4.1")
