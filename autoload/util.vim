" autoload util
if exists('g:loaded_vftplug_autoload')
    finish
endif
let g:loaded_vftplug_autoload = 1

" UTILFUNC: {{{
" =============================================================================
" generate source code header boilerplate {{{
function util#vftplug_gen_header(comment_char, prefix='', suffix='')
    let header_info = ''
    if a:prefix !=# ''
        let header_info = header_info. a:comment_char. ' '. a:prefix. "\n"
    endif
    let filename = expand('%:t'). ' -'
    let header_info = header_info. a:comment_char. ' '. filename. "\n"
    let header_dict = copy(g:vftplug_header_info)
    let header_dict['Last Change'] = strftime('%Y %b %d')
    for [k, v] in items(header_dict)
        let info = a:comment_char. ' '. k. ': '. v. "\n"
        let header_info = header_info. info
    endfor
    if a:suffix !=# ''
        let header_info = header_info. a:comment_char. ' '. a:suffix. "\n"
    endif

    let cur_pos = getpos('.')
    execute "normal ggO". header_info. "\<esc>"
    call setpos('.', cur_pos)
endfunction
" }}}
" }}}
" vim:foldmethod=marker:foldcolumn=1:ts=4:sw=4
