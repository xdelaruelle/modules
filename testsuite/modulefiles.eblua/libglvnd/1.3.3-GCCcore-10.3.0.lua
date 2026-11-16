whatis("Description: module name and version")
local root = "/software/libglvnd/1.3.3-GCCcore-10.3.0"
conflict("libglvnd")
depends_on("GCCcore/10.3.0")
depends_on("X11/20210518-GCCcore-10.3.0")
prepend_path("__EGL_VENDOR_LIBRARY_DIRS", "/usr/share/glvnd/egl_vendor.d")
