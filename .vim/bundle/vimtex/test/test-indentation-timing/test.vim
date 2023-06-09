set nocompatible
set runtimepath^=../..
set runtimepath+=../../after
filetype plugin indent on
syntax enable

nnoremap q :qall!<cr>

silent edit thesis.tex

" call vimtex#profile#start()
silent normal! gg=G
" call vimtex#profile#stop()

quit!

" Reported timings
" 2019-10-06 @ lotti
"   Time (mean ± σ):      1.717 s ±  0.041 s    [User: 1.703 s, System: 0.013 s]
"   Range (min … max):    1.681 s …  1.762 s    3 runs
" 2019-10-22 @ lotti
"   Time (mean ± σ):      1.679 s ±  0.005 s    [User: 1.670 s, System: 0.007 s]
"   Range (min … max):    1.674 s …  1.683 s    3 runs
