" Vim autoload omnicomplete plugin file
" Language:         Racket
" Maintainer:       Micah Elliott

" Most completion is handled as a dictionary. This is a working placeholder
" in case omnicomplete is later preferred, reasons like:
" - for inline explanation
" - avoid conflation with typical ^N/^P completion

"echom 'loading racketcomplete'
"sleep 1

runtime autoload/funcs.vim

fun! racketcomplete#CompleteRacket(findstart, base)
  if a:findstart
    " locate the start of the word
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '\a'
      let start -= 1
    endwhile
    return start
  else
    " find months matching with "a:base"
    let res = []
    "let funcs = ['map', 'list', 'list*', 'list?', 'length', 'sub1']
    "let funcs = split('map list list* list? length sub1')
    for m in g:funcs
      if m =~ '^' . a:base
        call add(res, m)
      endif
    endfor
    return res
  endif
endfun
