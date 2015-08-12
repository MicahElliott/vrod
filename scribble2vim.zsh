#! /usr/bin/env zsh

#cd ~/.racket/6.1.1/pkgs/racket-doc/scribblings/reference
#cd racketdoc.orig
#cd txt
cd doc

# Generate all txt files
#for s in *.scrbl; do print $s; ~/.racket/6.1.1/bin/scribble --dest doc --text $s; done

munge() {
  fl=$1
  prefix=$fl:r-  # ex: pairs
  prefix=''

  # Remove silly eol spaces
  sed -ri 's/\s+$//g' $fl

  # Add start of example text with new line containing ">"
  #perl -0777 -i -pe 's/\n\nExamples?:\n/\n\nExamples:\n>\n/igms' $fl

  # Add line to close examples containing "<"
  ##vim           %s/^\(  > (.*\n.\{}\n\)\n/\1<
  #perl -0777 -i -pe 's/(\n  > \([^\n]*\n.*?\n)\n/\1<\n\n/igms' $fl
  # Silly hack since abover regex produces <\n<
  #perl -0777 -i -pe 's/\n<\n</\n</igms' $fl

  # Add to function line a "~" (perl had trouble with unicode)
  perl -0777 -i -pe 's/(\n\n\([a-z]+[^\n]+)/\1 ~/igms' $fl

  # Add to arg lines a "~" (perl had trouble with unicode)
  sed -ri 's/(\xa0.*):(.*)/\1:\2 ~/' $fl

  # Add *-quoted line as new line above
  #perl -0777 -i -pe 's/\n\n(\(([a-z?!\/*>-]+).*?\n)/\n\n                                        *'$prefix'\2*\n\1/igms' $fl
  # ftp://ftp.cs.utexas.edu/pub/garbage/cs345/schintro-v13/schintro_104.html
  # + - . * / < = > ! ? : $ % _ & ~ ^ .
  perl -0777 -i -pe 's/\n\n(\(([a-z0-9?!\/*<>\+\.:\$%_&~\^-]+).*?\n)/\n\n                                        *'$prefix'\2*\n\1/igms' $fl
}

for t in *.txt; do print $t; munge $t; done
#munge reference.txt

# Generate omnicomplete words:
# grep -P '\*[a-z=\!\?\-]+\*' doc/*.txt |s 's/.*\*([a-z].*)\*$/\1/'

# Need to then convert into a vim data structure (list or list-of-kv-hashes),
# or dictionary
