" ========================================
" .gvimrc
" ========================================
scriptencoding utf-8

set guioptions=cg
set guicursor+=a:blinkon0

set guifont=Hack-Regular:h13
set guifontwide=NotoSansJP-Regular:h13
set linespace=1

let s:colorscheme = 'everforest'
execute 'colorscheme' s:colorscheme
let g:lightline_colorscheme = s:colorscheme

if has('vim_starting')
  set columns=140
  set lines=50
endif
