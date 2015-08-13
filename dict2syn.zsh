#! /usr/bin/env zsh

# dict2syn — generate a vim syntax file from dict list of funcs
#
# This is just an augmentation to racket.vim's syntax; it misses some funcs

# Generate a keywords-only file from existing racket.vim syntax file
for kw in $(sed -n 's/^syn keyword racketSyntax //p' ~/config/vim/bundle/vim-racket/syntax/racket.vim ); do
  print $kw
done >tmp/kws.txt

# Do set-diff of all funcs with racket keywords
comm -23 =(sort dict/funcs.txt) =(sort tmp/kws.txt) >tmp/nonkws.txt

# Create the final vim syntax file
sed 's/^/syn keyword racketFunc /' tmp/nonkws.txt >syntax/racket.vim

print "Created new secondary syntax/racket.vim file."
