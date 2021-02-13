" litewiki.vim plugin
" Language: litewiki *.wiki.* files
" Author: Rudy Dellomas III <dther@dther.xyz>
" Version: 0.1
"

function! litewiki#Index()
    " Go to the wiki directory and enter the file [index.md.wiki].
    if isdirectory(expand($LITEWIKI))
        normal! :e $LITEWIKI/index.wiki.md
"        lcd $LITEWIKI
    else
        echo "No wiki, please set $LITEWIKI"
    endif
endfunction

function! litewiki#Next()
    " search for the next link, which is anything which matches the regex
    " expression below.
    silent! normal! /[(\[]\w*\.wiki\.\w*[)\]]
endfunction

function! litewiki#Prev()
    " search for the previous link, which is anything which matches the regex
    " expression below.
    silent! normal! ?[(\[]\w*\.wiki\.\w*[)\]]
endfunction

function! litewiki#Follow()
    " Follow link under cursor
    if !(matchstr(expand("<cfile>"), "\w*\.wiki\.\w*")==".wiki.")
        echo "Not valid file!"
    elseif !empty(glob("<cfile>"))
        lcd %:p:h
        normal! gf
    else
        lcd %:p:h
        normal! :execute "edit" expand("<cfile>")
    endif
endfunction
