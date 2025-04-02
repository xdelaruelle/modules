" Vim syntax file
" Language:     Tcl Modulefile
" Maintainer:   Xavier Delaruelle <xavier.delaruelle@cea.fr>
" Original:     Felix Neumärker <xdch47@posteo.de>
" Reference:    https://modules.readthedocs.io/en/latest/modulefile.html

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

runtime syntax/tcl.vim

syn iskeyword @,48-57,_,192-255,-

" Modulefile commands
syn keyword modCommand  add-property always-load append-path chdir complete conflict
syn keyword modCommand  depends-on depends-on-any family getenv getvariant hide-modulefile
syn keyword modCommand  hide-version is-avail is-loaded is-saved is-used lsb-release
syn keyword modCommand  module module-alias module-forbid module-help module-hide
syn keyword modCommand  module-info module-tag module-version module-virtual module-warn
syn keyword modCommand  module-whatis modulepath-label prepend-path prereq prereq-all
syn keyword modCommand  prereq-any pushenv remove-path reportError reportWarning
syn keyword modCommand  require-fullname set-alias set-function setenv source-sh system
syn keyword modCommand  uname uncomplete unset-alias unset-function unsetenv variant
syn keyword modCommand  versioncmp x-resource

" Modulefile procedures
syn keyword modProc     ModulesHelp ModulesDisplay ModulesTest

" Modulefile variables
syn keyword modVar      ModulesVersion ModulesCurrentModulefile ModuleTool ModuleToolVersion
syn keyword modVar      ModuleVariant

hi def link modCommand  Special
hi def link modProc     Special
hi def link modVar      Special

let b:current_syntax = "modulefile"

" vim:set tabstop=4 shiftwidth=4 expandtab textwidth=100:
