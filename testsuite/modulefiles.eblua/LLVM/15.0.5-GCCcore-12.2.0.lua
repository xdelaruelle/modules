whatis("Description: module name and version")
local root = "/software/LLVM/15.0.5-GCCcore-12.2.0"
conflict("LLVM")
depends_on("GCCcore/12.2.0")
depends_on("ncurses/6.3-GCCcore-12.2.0")
depends_on("zlib/1.2.12-GCCcore-12.2.0")
setenv("ASAN_SYMBOLIZER_PATH", "/software/LLVM/15.0.5-GCCcore-12.2.0/bin/llvm-symbolizer")
