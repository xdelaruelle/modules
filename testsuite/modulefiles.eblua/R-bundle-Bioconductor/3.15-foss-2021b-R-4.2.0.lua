whatis("Description: module name and version")
local root = "/software/R-bundle-Bioconductor/3.15-foss-2021b-R-4.2.0"
conflict("R-bundle-Bioconductor")
depends_on("foss/2021b")
depends_on("R/4.2.0-foss-2021b")
depends_on("Boost/1.77.0-GCC-11.2.0")
depends_on("GSL/2.7-GCC-11.2.0")
depends_on("arrow-R/6.0.0.2-foss-2021b-R-4.2.0")
