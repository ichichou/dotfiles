set encoding=utf-8
scriptencoding utf-8

filetype plugin indent on
syntax enable


" --------------------
" Memo
" --------------------
" Markdown のシンタックスハイライトを試す
" https://rcmdnk.com/rawhtml/vim-markdown/rcmdnk-vim-markdown-20141030.html


" --------------------
" File
" --------------------
set hidden
set autoread
set switchbuf=usetab

set splitbelow
set splitright

" set shellslash

set helplang=ja,en

set noswapfile
set nobackup
set nowritebackup


" --------------------
" Appearance
" --------------------
colorscheme hybrid
" hybrid iceberg japanesque tender deep-space nord gruvbox

let g:lightline = { 'colorscheme': 'hybrid' }
" powerline wombat jellybeans solarized PaperColor seoul256 Dracula one landscape
" hybrid iceberg tender tenderplus deepspace nord gruvbox

set background=dark
"set termguicolors

set title
set number
set cursorline
set showmatch
set matchtime=1

set laststatus=2
set ruler
set showcmd
set noshowmode
" set showtabline=2

set display=lastline
set scrolloff=5
set breakindent

set belloff=all
" set noerrorbells

set list
set listchars=eol:¬,tab:»\ ,trail:\ ,extends:>,precedes:<,nbsp:%
set ambiwidth=double

set guioptions+=c
set guioptions-=e
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
" set guioptions-=m
" set guioptions-=T


" --------------------
" Edit
" --------------------
set tabstop=4
set softtabstop=4
set expandtab
set smarttab

set shiftwidth=4
set shiftround
set autoindent
set smartindent

set virtualedit=block
set backspace=indent,eol,start
set clipboard=unnamed

set nrformats-=octal

set mouse=a
set ttymouse=xterm2


" --------------------
" Search / Completion
" --------------------
set wrapscan
set incsearch
set hlsearch
set ignorecase
set smartcase
set gdefault

set wildmenu
set wildmode=list:longest,full
set history=10000

set completeopt=menu,menuone,preview
set infercase
set pumheight=10


" --------------------
" Keymap
" --------------------
" let mapleader = ','
" noremap \ ,

" inoremap <ESC> <ESC><kana>

nnoremap ; :
nnoremap : ;

noremap Y y$

noremap j gj
noremap k gk
noremap gj j
noremap gk k

" noremap <Space>h ^
" noremap <Space>l $

nnoremap + <C-a>
nnoremap - <C-x>

nnoremap <silent> <ESC><ESC> :nohlsearch<CR>
nnoremap <Space>h :<C-u>vertical belowright help<Space>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

noremap ZZ <Nop>
noremap ZQ <Nop>
noremap Q <Nop>


" --------------------
" vim-plug
" --------------------
" :PlugInstall, :PlugStatus, :PlugUpdate, :PlugClean

if empty(glob('~/.vim/autoload/plug.vim'))
  call system('mkdir -p ~/.vim/colors')
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'vim-jp/vimdoc-ja'
Plug 'itchyny/lightline.vim'
Plug 'cocopon/lightline-hybrid.vim'
Plug 'cocopon/vaffle.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tyru/open-browser.vim'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'w0ng/vim-hybrid', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'cocopon/iceberg.vim', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'aereal/vim-colors-japanesque', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'jacoborus/tender.vim', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'tyrannicaltoucan/vim-deep-space', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'arcticicestudio/nord-vim', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'morhetz/gruvbox', {'do': 'cp colors/* ~/.vim/colors/'}

call plug#end()


" --------------------
" Plugin Settings
" --------------------
" Vaffle
let g:vaffle_auto_cd = 1
let g:vaffle_show_hidden_files = 1

" vim-better-whitespace
highlight ExtraWhitespace ctermbg=DarkRed
highlight ExtraWhitespace guibg=DarkRed

" open-browser.vim
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" vim-autoclose

