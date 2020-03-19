" python plugin

" boilerplate {{{
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

if exists('g:vftplug_loaded_python')
    finish
endif
let g:vftplug_loaded_python = 1
" }}}

" set variable {{{
setlocal textwidth=80

setlocal shiftwidth=2
setlocal tabstop=2

setlocal expandtab
" }}}
