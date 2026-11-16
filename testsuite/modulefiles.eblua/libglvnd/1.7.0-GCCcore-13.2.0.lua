whatis("Description: module name and version")
local root = "/software/libglvnd/1.7.0-GCCcore-13.2.0"
conflict("libglvnd")
depends_on("GCCcore/13.2.0")
depends_on("X11/20231019-GCCcore-13.2.0")
prepend_path("__EGL_VENDOR_LIBRARY_DIRS", "/usr/share/glvnd/egl_vendor.d")
