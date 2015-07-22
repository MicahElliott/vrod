# Vim omnicomplete and Built-in Documentation for Racket

This plugin turns Racket reference docs into Vim help. That’s kinda’ weird,
but works out well. Racket doesn’t have help built into its repl or source
code, so the niceties of Clojure inline docs are not very possible without
things like this plugin.

Use <kbd>K</kbd> while on any Racket function to access its reference help
documentation through Vim’s help system.

_BONUS:_ Use <kbd>Ctrl</kbd><kbd>X</kbd><kbd>O</kbd> to omni-complete any
standard Racket function.

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
