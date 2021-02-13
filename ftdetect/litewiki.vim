" Vim filetype detection file
" Language: litewiki files (*.wiki.*, generally .wiki.md)
" Author: Rudy Dellomas III (dther@dther.xyz)

" Last Change: 2021 Feb 05
"

autocmd! BufRead,BufNewFile *.wiki.* set filetype+=.litewiki
