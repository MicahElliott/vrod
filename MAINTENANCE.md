# Maintainer Notes

It is unfortunate that the Racket Reference contains a lot of redundant
docs (via includes). Furthermore, there are often
multiple function docs for a given function name. So you end up with multiple
identical tags, which makes Vim whiny. So you’ll see lots of (innocuous)
errors as the docs (tags) are generated. Just ignore the errors.

To regenerate a new set of text files from fresh Rackets docs:

    cd ~/.racket/6.1.1/pkgs/racket-doc/scribblings/reference
    for s in *.scrbl; do print $s; ~/.racket/6.1.1/bin/scribble --dest doc --text $s; done
    rm doc/data.txt doc/reference.txt
    ./scribble2vim.zsh

To generate the omni list:

    grep -P '\*[a-z=\!\?\-]+\*' doc/*.txt |s 's/.*\*([a-z].*)\*$/\1/' >dict/funcs.txt

An alternative to scraping the omni functions out of the reference would be to
process `syntax/racket.vim`.
