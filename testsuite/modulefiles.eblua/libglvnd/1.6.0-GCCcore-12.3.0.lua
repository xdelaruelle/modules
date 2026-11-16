whatis("Description: module name and version")
local root = "/software/libglvnd/1.6.0-GCCcore-12.3.0"
conflict("libglvnd")
depends_on("GCCcore/12.3.0")
depends_on("X11/20230603-GCCcore-12.3.0")
prepend_path("__EGL_VENDOR_LIBRARY_DIRS", "/usr/share/glvnd/egl_vendor.d")
