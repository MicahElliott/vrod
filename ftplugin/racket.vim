" Vim filetype plugin file
" Language:         Racket
" Maintainer:       Micah Elliott

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1


" Enable completions
setl omnifunc=racketcomplete#CompleteRacket

" Dictionary-style completion of racket keywords
setl complete+=k
" Not sure where to safely put this dict file, so hackishly abs-pathing it
"setl dict=funcs.txt
setl dict=~/.vim/bundle/vim-racket-omni-docs/dict/funcs.txt

" Kill off vim-racket's idea of K; these don't work here
"nunmap <buffer> K
"nunmap K
"nnoremap <buffer> K <nop>

" Add our local docs; this is probably already the default
setl keywordprg=:help
"nnoremap K

" HACK: non-standard doc/ dir to bypass auto-:helptags tags generation
let &runtimepath = expand('<sfile>:h').'/../racket,' . &runtimepath
