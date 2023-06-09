set nocompatible
set runtimepath^=../..
filetype plugin on

set wildmode=longest:full,full
set wildcharm=<c-z>


" cse  /  Change surrounding environment
" .    /  Dot repeat
call vimtex#test#keys("cse\<c-z>\<c-z>\<c-z>\<cr>",
      \[
      \ '\begin{foo}',
      \ '  Foo',
      \ '\end{foo}',
      \],
      \[
      \ '\begin{abstract}',
      \ '  Foo',
      \ '\end{abstract}',
      \])


call vimtex#test#finished()
