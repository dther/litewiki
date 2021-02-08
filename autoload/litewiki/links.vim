" litewiki.vim plugin
" Language: litewiki *.wiki.* files
" Author: Rudy Dellomas III <dther@dther.xyz>
" Version: 0.1
" Last Change: 2021 Feb 08
"
function! litewiki#links#Next()
    " search for the next link, which is anything which matches the regex
    " expression below.
    silent! normal! /[(\[]\w*\.wiki\.\w*[)\]]
endfunction

function! litewiki#links#Prev()
    " search for the previous link, which is anything which matches the regex
    " expression below.
    silent! normal! ?[(\[]\w*\.wiki\.\w*[)\]]
endfunction

function! litewiki#links#Follow()
    " Follow link under cursor
    if !(matchstr(expand("<cfile>"), "\w*\.wiki\.\w*")==".wiki.")
        echo "Not valid file!"
    elseif !empty(glob("<cfile>"))
        normal! gf
    else
        normal! :execute "edit" expand("<cfile>")
    endif
endfunction
