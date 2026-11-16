whatis("Description: module name and version")
local root = "/software/ncdf4/1.17-foss-2021a-R-4.1.0"
conflict("ncdf4")
depends_on("foss/2021a")
depends_on("R/4.1.0-foss-2021a")
depends_on("netCDF/4.8.0-gompi-2021a")
prepend_path("R_LIBS_SITE", pathJoin(root, ""))
