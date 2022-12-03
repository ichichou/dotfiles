" ========================================
" .gvimrc
" ========================================

scriptencoding utf-8

if has('gui_macvim')
    let g:macvim_skip_colorscheme = 1
    let g:no_gvimrc_example = 1
endif

set guioptions=cg
set guicursor+=a:blinkon0
set guifont=Hack-Regular:h12
set guifontwide=NotoSansJP-Regular:h12

colorscheme nord
set linespace=2

if has('vim_starting')
    set columns=140
    set lines=50
endif
