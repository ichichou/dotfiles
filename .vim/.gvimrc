" ========================================
" .gvimrc
" ========================================

scriptencoding utf-8

if has('gui_macvim')
    let g:macvim_skip_colorscheme = 1
endif

set background=dark
colorscheme hybrid
" hybrid iceberg nord tender

set guifont=Myrica\ Monospace:h14
" set guifont=Hack:h14
" set guifontwide=Noto\ Sans\ Mono\ CJK\ JP:h14

set ambiwidth=double
set linespace=2

if has('vim_starting')
    set columns=140
    set lines=50
endif

set guicursor&
set guicursor+=a:blinkon0

set guioptions&
set guioptions+=c
set guioptions-=e
set guioptions-=m
set guioptions-=r
set guioptions-=L
set guioptions-=t
set guioptions-=T
