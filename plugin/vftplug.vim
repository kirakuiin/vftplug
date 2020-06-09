" vftplug.vim - A set of plugins which are useful for programmers
" Author: Wang Zhuowei <wang.zhuowei@foxmail.com>
" Version: 1.0
" License: This file is placed in the public domain.
" Last Change: 2020 March 20

if exists('g:loaded_vftplug')
    finish
endif
let g:loaded_vftplug = 1

let save_cpo = &cpo
set cpo&vim

" set support lang {{{
if !exists('g:vftplug_support_lang')
    let g:vftplug_support_lang = ['python', 'vim', 'cpp']
endif

for suffix in g:vftplug_support_lang
    execute 'let g:vftplug_enable_'. suffix. ' = 1'
endfor
" }}}

" constant definition {{{
if !exists('g:vftplug_header_info')
    let g:vftplug_header_info = {
                \'Author' : 'Anonymous',
                \'Version' : '1.0',
                \'License' : 'This file is placed in the public domain.',
                \}
endif
" }}}

" map {{{
if !hasmapto('<Plug>VftpGeneHeader')
    map <unique> <localleader>gh <Plug>VftpGeneHeader
    map <unique> <localleader>gg <Plug>VftpGeneGuard
endif
" }}}

let &cpo = save_cpo
" vim:foldmethod=marker:foldcolumn=1:ts=4:sw=4
