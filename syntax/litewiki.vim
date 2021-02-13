" litewiki.vim plugin, syntax highlighting
" Language: litewiki *.wiki.* files
" Author: Rudy Dellomas III <dther@dther.xyz>
" Version: 0.1


syntax match LitewikiFile /\w*\.wiki\.\w*/
" syntax region LitewikiLink matchgroup=LitewikiLinkDelimiter start="\[" end="\]" contains=LitewikiFile keepend contained

highlight default link LitewikiFile htmlLink
