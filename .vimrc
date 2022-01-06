" ========================================
" .vimrc
" ========================================

set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=utf-8,sjis,euc-jp,iso-2022-jp,cp932
set fileformats=unix,dos,mac

filetype plugin indent on
syntax enable

augroup vimrc
    autocmd!
augroup END

unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

let g:no_vimrc_example = 1
let g:no_gvimrc_example = 1

let g:loaded_gzip               = 1
let g:loaded_tar                = 1
let g:loaded_tarPlugin          = 1
let g:loaded_zip                = 1
let g:loaded_zipPlugin          = 1
let g:loaded_rrhelper           = 1
let g:loaded_vimball            = 1
let g:loaded_vimballPlugin      = 1
let g:loaded_getscript          = 1
let g:loaded_getscriptPlugin    = 1
" let g:loaded_netrw              = 1
let g:loaded_netrwPlugin        = 1
let g:loaded_netrwSettings      = 1
let g:loaded_netrwFileHandlers  = 1
let g:did_install_default_menus = 1
let g:skip_loading_mswin        = 1
let g:did_install_syntax_menu   = 1
let g:loaded_2html_plugin       = 1

" ----------------------------------------
" Editing
" ----------------------------------------

set hidden
set autoread
set switchbuf=usetab

set noswapfile
set nobackup
set nowritebackup

set shell=fish
set history=10000
" set updatetime=300
set helplang=ja,en

set clipboard&
set clipboard^=unnamed,unnamedplus
set mouse=a
set ttymouse=xterm2

set virtualedit=onemore
set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
set textwidth=0

set nrformats&
set nrformats-=octal

set expandtab
set smarttab
set shiftround
set autoindent
set smartindent

set tabstop=4
set softtabstop=4
set shiftwidth=4

augroup vimrc
    autocmd FileType c,cpp,java setlocal tabstop=4 softtabstop=4 shiftwidth=4 cindent
    autocmd FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType nim setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType go setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
    autocmd FileType html,css setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

autocmd vimrc FileType gitcommit setlocal fileencoding=utf-8

" ----------------------------------------
" Appearance
" ----------------------------------------

" set termguicolors
set background=dark

set list
set listchars=eol:¬,tab:»\ ,space:\ ,trail:\ ,extends:>,precedes:<,nbsp:~

set title
set number
set cursorline
set nocursorcolumn

set showtabline=1
" set signcolumn=yes
set laststatus=2
" set cmdheight=2
set noshowmode
set showcmd
set ruler

set scrolloff=3
set display=lastline
set breakindent
set nofoldenable
autocmd vimrc FileType vim setlocal foldmethod=marker

set splitbelow
set splitright

set belloff=all

set showmatch
set matchtime=1
set matchpairs&
set matchpairs+=（:）,［:］,｛:｝,「:」,『:』,〈:〉,《:》,【:】,〔:〕,‘:’,“:”

source $VIMRUNTIME/macros/matchit.vim
let b:match_ignorecase = 1
" let b:match_words = "<if>:<endif>"

if has("gui_running")
    set fuoptions=maxvert,maxhorz
    autocmd vimrc GUIEnter * set fullscreen
endif

" ----------------------------------------
" Search/Completion
" ----------------------------------------

set incsearch
set hlsearch
set ignorecase
set smartcase
set noinfercase
set gdefault
set wrapscan

set wildmenu
set wildmode=full
set pumheight=10
set completeopt=menuone,popup
" set shortmess&
" set shortmess+=c

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

augroup vimrc
    autocmd FileType help,qf,man,ref,diff nnoremap <silent> <buffer> q :q!<CR>
    autocmd QuickFixCmdPost *grep*,make if len(getqflist()) != 0 | cwindow | endif
augroup END

" ----------------------------------------
" Plugins
" ----------------------------------------

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !mkdir -p ~/.vim/colors
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Vim-Polyglot
" --------------------
let g:polyglot_disabled = ['markdown', 'csv']

" General
" --------------------
Plug 'LeafCage/yankround.vim'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'cocopon/lightline-hybrid.vim'
Plug 'cocopon/vaffle.vim'
Plug 'cohama/vim-smartinput-endwise'
Plug 'dense-analysis/ale'
Plug 'easymotion/vim-easymotion'
Plug 'glidenote/memolist.vim'
Plug 'godlygeek/tabular'
Plug 'haya14busa/is.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-highlighturl'
Plug 'kana/vim-smartinput'
Plug 'mattn/emmet-vim'
Plug 'mattn/vim-maketable'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tyru/caw.vim'
Plug 'tyru/open-browser.vim'
" Plug 'kana/vim-repeat'

Plug '/opt/homebrew/opt/fzf'
Plug 'junegunn/fzf.vim'

" Operator / Text Object
" --------------------
Plug 'haya14busa/vim-operator-flashy'
Plug 'kana/vim-operator-replace'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'rhysd/vim-operator-surround'

" Language
" --------------------
Plug 'aklt/plantuml-syntax', {'for': 'plantuml'}
Plug 'habamax/vim-asciidoctor', {'for': 'asciidoc'}
Plug 'joker1007/vim-markdown-quote-syntax', {'for': 'markdown'}
Plug 'mechatroner/rainbow_csv', {'for': 'csv'}
Plug 'prettier/vim-prettier', {'for': ['html', 'markdown', 'yaml', 'css', 'less', 'scss', 'javascript', 'json']}
Plug 'previm/previm', {'for': 'markdown'}
Plug 'rcmdnk/vim-markdown', {'for': 'markdown'}
Plug 'sheerun/vim-polyglot'
Plug 'vim-jp/syntax-vim-ex', {'for': 'vim'}

" Japanese Support
" --------------------
Plug 'deton/jasegment.vim'
Plug 'deton/jasentence.vim'
Plug 'haya14busa/vim-migemo'
Plug 'vim-jp/vimdoc-ja'

" Colorscheme
" --------------------
Plug 'arcticicestudio/nord-vim', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'cocopon/iceberg.vim', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'jacoborus/tender.vim', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'w0ng/vim-hybrid', {'do': 'cp colors/* ~/.vim/colors/'}

call plug#end()

runtime! config/*.vim
