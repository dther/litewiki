# litewiki.vim

An austere, minimalist vimwiki-style note-taking plugin.

Vimwiki has a lot of cool features which I have no use for.
I (used to) use vimwiki to create a hyperlinked collection of notes,
but found that I could replace it almost entirely using three commands.

This is a slightly more feature full version of those three commands.
All you need to know is:

 * A valid filename is anything which matches the regex `/*.wiki.*/`
   Valid filenames can be entered or created using <Enter>.
 * Links to other .wiki.\* pages can be standard markdown links,
   or shorthand in the style of `[Foo.wiki.bar]`.
   Valid links can be jumped to using <Tab>.
 * There's no requirement that files be markdown.
   If you want to add links in non-markdown files, put a markdown or
   shorthand link inside a comment.

## Planned Features

 * Shorthand link (`[Example.wiki.md]`) expansion to standard Markdown
 * Export-to-html script leveraging command line utilities
 * Live HTML view via hacky browser interfacing
