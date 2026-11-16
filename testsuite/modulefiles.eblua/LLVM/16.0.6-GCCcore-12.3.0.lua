whatis("Description: module name and version")
local root = "/software/LLVM/16.0.6-GCCcore-12.3.0"
conflict("LLVM")
depends_on("GCCcore/12.3.0")
depends_on("ncurses/6.4-GCCcore-12.3.0")
depends_on("zlib/1.2.13-GCCcore-12.3.0")
setenv("ASAN_SYMBOLIZER_PATH", "/software/LLVM/16.0.6-GCCcore-12.3.0/bin/llvm-symbolizer")
