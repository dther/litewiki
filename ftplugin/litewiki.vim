" litewiki.vim plugin
" Language: litewiki *.wiki.* files
" Author: Rudy Dellomas III <dther@dther.xyz>
" Version: 0.1
" Last Change: 2021 Feb 08
"
" Only do this when not done yet for this buffer
if exists("b:did_litewiki")
  finish
endif
let b:did_litewiki = 1

nnoremap <Tab> :call litewiki#Next()<CR>
nnoremap <CR> :call litewiki#Follow()<CR>

nnoremap <leader>lw :call litewiki#Index()<CR>
