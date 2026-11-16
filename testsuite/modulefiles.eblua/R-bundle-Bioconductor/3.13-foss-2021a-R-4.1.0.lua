whatis("Description: module name and version")
local root = "/software/R-bundle-Bioconductor/3.13-foss-2021a-R-4.1.0"
conflict("R-bundle-Bioconductor")
depends_on("foss/2021a")
depends_on("R/4.1.0-foss-2021a")
depends_on("Boost/1.76.0-GCC-10.3.0")
depends_on("GSL/2.7-GCC-10.3.0")
depends_on("ncdf4/1.17-foss-2021a-R-4.1.0")
depends_on("arrow-R/6.0.0.2-foss-2021a-R-4.1.0")
