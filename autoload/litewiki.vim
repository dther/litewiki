" litewiki.vim plugin
" Language: litewiki *.wiki.* files
" Author: Rudy Dellomas III <dther@dther.xyz>
"

" to allow using shell scripts
let s:script_folder_path = expand("<sfile>:p:h:h/bin/")

function! litewiki#ExpandLinks()
    normal! :%s/\[\(.*\)\(\.wiki\..*\)\]/[\1](\1\2)/g
endfunction

" Export to HTML
" Might be better to do this with an external script. I'll work it out.
function! litewiki#ExportHtml()
    if expand("%:e:e") !=? "wiki.md"
        echo "Not a wiki.md file."
    else
        "$LITEWIKI has to be expanded for this to work.
        "i.e. can't use ~ as home
        normal! :!markdown % > $LITEWIKI/html/%:r.html
    endif
endfunction

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
