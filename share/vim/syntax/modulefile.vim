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
syn keyword modCommand  depends-on depends-on-any family getenv getvariant haveDynamicMPATH
syn keyword modCommand  hide-modulefile hide-version is-avail is-loaded is-saved is-used
syn keyword modCommand  lsb-release module module-alias module-forbid module-help
syn keyword modCommand  module-hide module-info module-tag module-version module-virtual
syn keyword modCommand  module-warn module-whatis modulepath-label prepend-path prereq
syn keyword modCommand  prereq-all prereq-any provide pushenv remove-path reportError
syn keyword modCommand  reportWarning require-fullname set-alias set-function setenv
syn keyword modCommand  source-sh system uname uncomplete unset-alias unset-function
syn keyword modCommand  unsetenv variant versioncmp x-resource

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
