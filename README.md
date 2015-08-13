# VROD: Vim built-in Racket Omni-completion and Documentation

![VROD!](https://raw.githubusercontent.com/MicahElliott/vrod/master/vrod.png)

Why browse HTML pages when you can view docs right in Vim with `K`?

This plugin turns Racket reference docs into Vim help. That’s kinda’ weird,
but works out well. Racket doesn’t have help built into its repl or source
code, so the niceties of Clojure inline docs are not very possible without
things like this plugin.

Use <kbd>K</kbd> while on any Racket function to access its reference help
documentation through Vim’s help system.

_BONUS:_ Use <kbd>Ctrl</kbd><kbd>X</kbd><kbd>O</kbd> to omni-complete any
standard Racket function. Actually, just use
<kbd>Ctrl</kbd><kbd>N</kbd>/<kbd>Ctrl</kbd><kbd>P</kbd>, since it’s not yet
smart enough to bother with true Omnicompletion.

There is also an extended syntax file for carefully highlighting all the
programmatically discovered functions, yet carefully excluding Racket
primitives. This is helpful because
[vim-racket](https://github.com/wlangstroth/vim-racket) misses quite a few
functions.

## How It’s Made

The full set of Racket’s Reference scribble docs has been converted to text,
and parsed/munged a bit to add `*foo*` markers that Vim’s `:helptags` uses.

Then those markers were collected into a list that Vim uses for
omnicompletion.

## Installation

If you use Vundle/Pathogen, note that the doc generation phase is not like
other Vim plugins. The tags file is already part of this plugin (it’s a pain
to build), so you don’t want Vundle/Pathogen trying to build it. But don’t
worry about this; it should be transparent.

## Shortcomings
- Not completing functions from packages.
- Not real omnicompletion; using dictionary instead for now
