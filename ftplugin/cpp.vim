" cpp plugin

" boilerplate {{{
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

if exists('g:loaded_vftplug_cpp')
    finish
endif
let g:loaded_vftplug_cpp= 1
" }}}

" check cpp is enable or not {{{
if !exists('g:vftplug_enable_cpp')
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
    let comment_char = '//'
    call util#vftplug_gen_header(comment_char, '', '')
endfunction
" }}}

" generate header define guard {{{
function! s:Vftplug_gen_guard()
    let file_exp = toupper(expand('%:e'))
    if file_exp[0] !=# 'H'
        return
    endif
    let file_path = toupper(expand('%:p:r'))
    if has('win32') || has('win64')
        let guards = split(file_path, '\')
    else
        let guards = split(file_path, '/')
    endif
    " only keep last four word
    if len(guards) >= 4
        let guards = guards[-4:]
    endif
    let guard_name = '_'
    for word in guards
        let guard_name = guard_name. '_'. word
    endfor
    let guard_name = guard_name. '_'. file_exp. '__'
    execute "normal o". '#ifndef '. guard_name. "\n\<esc>"
    execute "normal i". '#define '. guard_name. "\n\<esc>"
    execute "normal i". '#endif // '. guard_name. "\<esc>"
endfunction
" }}}
" }}}

" map {{{
noremap <unique> <Plug>VftpGeneHeader :call <SID>Vftplug_gen_header()<CR>
noremap <unique> <Plug>VftpGeneGuard  :call <SID>Vftplug_gen_guard()<CR>
" }}}

" vim:foldmethod=marker:foldcolumn=1:ts=4:sw=4
