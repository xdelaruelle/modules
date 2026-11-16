whatis("Description: module name and version")
local root = "/software/libglvnd/1.4.0-GCCcore-11.3.0"
conflict("libglvnd")
depends_on("GCCcore/11.3.0")
depends_on("X11/20220504-GCCcore-11.3.0")
prepend_path("__EGL_VENDOR_LIBRARY_DIRS", "/usr/share/glvnd/egl_vendor.d")
