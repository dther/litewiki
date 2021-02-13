" litewiki.vim plugin
" Language: litewiki *.wiki.* files
" Author: Rudy Dellomas III <dther@dther.xyz>

"

" set this to 1 to make your own binds
if exists("b:did_litewiki_default")
  finish
endif
let b:did_litewiki_default = 1

nnoremap <Tab> :call litewiki#Next()<CR>
nnoremap <Backspace> :call litewiki#Prev()<CR>
nnoremap <CR> :call litewiki#Follow()<CR>
