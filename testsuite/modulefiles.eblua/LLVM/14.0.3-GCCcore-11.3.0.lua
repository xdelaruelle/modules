whatis("Description: module name and version")
local root = "/software/LLVM/14.0.3-GCCcore-11.3.0"
conflict("LLVM")
depends_on("GCCcore/11.3.0")
depends_on("ncurses/6.3-GCCcore-11.3.0")
depends_on("zlib/1.2.12-GCCcore-11.3.0")
setenv("ASAN_SYMBOLIZER_PATH", "/software/LLVM/14.0.3-GCCcore-11.3.0/bin/llvm-symbolizer")
