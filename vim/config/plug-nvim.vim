let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" Language Server

" Vim-Polyglot
let g:polyglot_disabled = ['markdown.plugin', 'csv.plugin', 'r-lang.plugin']
" let g:polyglot_disabled += ['autoindent']
" let g:polyglot_disabled += ['sensible']

Plug 'sheerun/vim-polyglot'

" Language
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'mechatroner/rainbow_csv', {'for': 'csv'}
Plug 'vim-jp/syntax-vim-ex', {'for': 'vim'}
Plug 'prettier/vim-prettier', {'for': ['html', 'markdown', 'yaml', 'css', 'less', 'scss', 'javascript', 'json']}

Plug 'joker1007/vim-markdown-quote-syntax', {'for': 'markdown'}
Plug 'rcmdnk/vim-markdown', {'for': 'markdown'}
Plug 'previm/previm', {'for': 'markdown'}

" Edditing
Plug 'LeafCage/yankround.vim'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'cocopon/vaffle.vim'
Plug 'cohama/vim-smartinput-endwise'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'haya14busa/vim-asterisk'
Plug 'kana/vim-niceblock'
Plug 'kana/vim-repeat'
Plug 'kana/vim-smartinput'
Plug 'mattn/vim-maketable'
Plug 'tyru/caw.vim'
Plug 'tyru/open-browser.vim'

set runtimepath+=/opt/homebrew/opt/fzf
Plug 'junegunn/fzf.vim'

" Appearance
Plug 'MunifTanjim/nui.nvim'
Plug 'folke/noice.nvim'
Plug 'haya14busa/is.vim'
Plug 'itchyny/vim-highlighturl'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'rbtnn/vim-ambiwidth'

" Operator / Text Object
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'
Plug 'kana/vim-operator-replace'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'rhysd/vim-operator-surround'

" Japanese Support
Plug 'brglng/vim-im-select'
Plug 'deton/jasegment.vim'
Plug 'deton/jasentence.vim'
Plug 'haya14busa/vim-migemo'
" Plug 'vim-jp/vimdoc-ja'

" Colorscheme
Plug 'arcticicestudio/nord-vim'

call plug#end()
