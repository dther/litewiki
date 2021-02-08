" litewiki.vim plugin, syntax highlighting
" Language: litewiki *.wiki.* files
" Author: Rudy Dellomas III <dther@dther.xyz>
" Version: 0.1
" Last Change: 2021 Feb 07

syntax match LitewikiLink /\[\w*\.wiki\.\w*\]/

highlight default link LitewikiLink htmlLink
