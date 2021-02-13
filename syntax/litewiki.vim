" litewiki.vim plugin, syntax highlighting
" Language: litewiki *.wiki.* files
" Author: Rudy Dellomas III <dther@dther.xyz>



syntax match LitewikiFile /\w*\.wiki\.\w*/
" syntax region LitewikiLink matchgroup=LitewikiLinkDelimiter start="\[" end="\]" contains=LitewikiFile keepend contained

highlight default link LitewikiFile htmlLink
