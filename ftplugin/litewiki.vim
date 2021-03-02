" litewiki.vim plugin
" Language: litewiki *.wiki.* files
" Author: Rudy Dellomas III <dther@dther.xyz>

"

" set this to 1 to make your own binds
if exists("b:did_litewiki_default")
  finish
endif
let b:did_litewiki_default = 1

setlocal suffixesadd=.wiki.md

nnoremap <silent> <buffer> <script> <Tab> :call litewiki#Next()<CR>
nnoremap <silent> <buffer> <script> <Backspace> :call litewiki#Prev()<CR>
nnoremap <silent> <buffer> <script> <CR> :call litewiki#Follow()<CR>
