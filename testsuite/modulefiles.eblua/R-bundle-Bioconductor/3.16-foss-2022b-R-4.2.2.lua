whatis("Description: module name and version")
local root = "/software/R-bundle-Bioconductor/3.16-foss-2022b-R-4.2.2"
conflict("R-bundle-Bioconductor")
depends_on("foss/2022b")
depends_on("R/4.2.2-foss-2022b")
depends_on("Boost/1.81.0-GCC-12.2.0")
depends_on("GSL/2.7-GCC-12.2.0")
depends_on("arrow-R/11.0.0.3-foss-2022b-R-4.2.2")
