" python plugin

" boilerplate {{{
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

if exists('g:loaded_vftplug_python')
    finish
endif
let g:loaded_vftplug_python = 1
" }}}

" check python is enable or not {{{
if !exists('g:vftplug_enable_python')
    finish
endif
" }}}

" set variable {{{
setlocal textwidth=80
setlocal nowrap

setlocal shiftwidth=4
setlocal tabstop=4

setlocal expandtab
" }}}

" util func {{{
" generate source code header boilerplate {{{
function! s:Vftplug_gen_header()
    let comment_char = '#'
    let prefix = '-*- encoding: utf-8 -*-'
    call util#vftplug_gen_header(comment_char, prefix, '')
endfunction
" }}}

" }}}

" map {{{
noremap <unique> <Plug>VftpGeneHeader :call <SID>Vftplug_gen_header()<CR>
" }}}

" vim:foldmethod=marker:foldcolumn=1:ts=4:sw=4
