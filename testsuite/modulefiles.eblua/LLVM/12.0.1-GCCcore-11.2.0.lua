whatis("Description: module name and version")
local root = "/software/LLVM/12.0.1-GCCcore-11.2.0"
conflict("LLVM")
depends_on("GCCcore/11.2.0")
depends_on("ncurses/6.2-GCCcore-11.2.0")
depends_on("zlib/1.2.11-GCCcore-11.2.0")
setenv("ASAN_SYMBOLIZER_PATH", "/software/LLVM/12.0.1-GCCcore-11.2.0/bin/llvm-symbolizer")
