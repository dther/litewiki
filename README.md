# litewiki.vim
*Version 1.0*

An austere, minimalist vimwiki-style note-taking plugin.

Vimwiki has a lot of cool features which I have no use for.
I (used to) use vimwiki to create a hyperlinked collection of notes,
but found that I could replace it almost entirely using three commands.

This is a slightly more feature full version of those three commands.
All you need to know is:

 * Set your desired wiki location to $LITEWIKI.
 * A valid filename is anything which matches the regex `/*.wiki.*/`
   Valid filenames can be entered or created using \<Enter>.
 * Links to other .wiki.\* pages can be standard markdown links,
   or shorthand in the style of `[Foo.wiki.bar]`.
   Valid links can be jumped to using \<Tab>.
 * Invalid links (e.g. names of files without surrounding delimiters)
   will still be syntax-highlighted and
   can still be followed, but can't be jumped to using \<Tab>
   and won't be turned into valid hyperlinks on HTML export.
 * There's no requirement that files be markdown.
   If you want to add links in non-markdown files, put a markdown or
   shorthand link inside a comment.
 * Run `litewiki2html.sh` in a POSIX-compliant system to convert
   $LITEWIKI into a hypertext wiki that can be viewed in the browser!

## Planned Features

 * Live HTML view via hacky browser interfacing

## NOT Planned Features

 * Journal functionality. I currently just have the following in my .vimrc:
```
nnoremap <leader>d<leader>d :Goyo<CR>:e ~/docs/diary/`date +\%Y-\%m-\%d`.wiki.md<CR>
```
 * Todo list functionality. I use `todotxt-cli`.
 * Tables. Plaintext tables suck. org-mode tables are the worst way to deal with plaintext tables,
   except for all the other ways to deal with plaintext tables. Just use csv and view it using something else.
 * Calendar integrations. `calcurse` is a nice, visual way to deal with personal planning.

## Licensing

(c) Rudy Dellomas III <dther@dther.xyz>

Made available under GPLv3, a copy of which should be provided in this repository
under "LICENSE".
