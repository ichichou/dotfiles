set encoding=utf-8
scriptencoding utf-8

filetype plugin indent on
syntax enable


" ----------------------------------------
" File
" ----------------------------------------
set hidden
set autoread
set switchbuf=usetab

set splitbelow
set splitright

set noswapfile
set nobackup
set nowritebackup

set helplang=ja,en


" ----------------------------------------
" Appearance
" ----------------------------------------
colorscheme hybrid
" hybrid iceberg japanesque tender deep-space nord gruvbox onedark

let g:lightline = { 'colorscheme': 'hybrid' }
" powerline wombat jellybeans solarized PaperColor seoul256 Dracula one landscape
" hybrid iceberg tender tenderplus deepspace nord gruvbox onedark

set background=dark
"set termguicolors

set title
set number
set cursorline
set showmatch
set matchtime=1

set showtabline=2
set laststatus=2
set ruler
set showcmd
set noshowmode

set display=lastline
set scrolloff=5
set breakindent

set belloff=all

set list
set listchars=eol:¬,tab:»\ ,trail:\ ,extends:>,precedes:<,nbsp:%
set ambiwidth=double

set guioptions+=c
set guioptions-=e
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b


" ----------------------------------------
" Edit
" ----------------------------------------
set tabstop=4
set softtabstop=4
set expandtab
set smarttab

set shiftwidth=4
set shiftround
set autoindent
set smartindent

set virtualedit=onemore
set backspace=indent,eol,start
set clipboard=unnamed

set nrformats-=octal

set mouse=a
set ttymouse=xterm2


" ----------------------------------------
" Search / Completion
" ----------------------------------------
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
" set pumheight=10


" ----------------------------------------
" Keymap
" ----------------------------------------
let mapleader = ','
noremap \ ,

noremap ; :
noremap : ;

noremap Y y$

noremap j gj
noremap k gk
noremap gj j
noremap gk k

nnoremap + <C-a>
nnoremap - <C-x>

nnoremap <silent> <ESC><ESC> :<C-u>nohlsearch<CR>

noremap ZZ <Nop>
noremap ZQ <Nop>
noremap Q <Nop>


" Window, Tab Page, Buffer
nnoremap t <Nop>
nnoremap [WINDOW] <Nop>
nmap t [WINDOW]

""" 開く・閉じる
nnoremap [WINDOW]o :<C-u>edit<space>
nnoremap [WINDOW]t :<C-u>tabedit<space>
nnoremap [WINDOW]d :<C-u>tabclose<CR>

""" タブ移動
nnoremap [WINDOW]mn :<C-u>tabmove +1<CR>
nnoremap [WINDOW]mp :<C-u>tabmove -1<CR>
nnoremap [WINDOW]m0 :<C-u>tabmove 0<CR>
nnoremap [WINDOW]m$ :<C-u>tabmove<CR>

""" ウィンドウ移動
nnoremap [WINDOW]h <C-w>h
nnoremap [WINDOW]j <C-w>j
nnoremap [WINDOW]k <C-w>k
nnoremap [WINDOW]l <C-w>l

nnoremap [WINDOW]H <C-w>H
nnoremap [WINDOW]J <C-w>J
nnoremap [WINDOW]K <C-w>K
nnoremap [WINDOW]L <C-w>L

""" ウィンドウサイズ
nnoremap [WINDOW]\ <C-w>|
nnoremap [WINDOW]- <C-w>_
nnoremap [WINDOW]= <C-w>=

""" ドキュメント
nnoremap [WINDOW]/ :<C-u>vertical belowright help<space>
nnoremap [WINDOW]? :<C-u>tab help<space>


" ----------------------------------------
" vim-plug
" ----------------------------------------
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
Plug 'cocopon/vaffle.vim'
Plug 'cocopon/lightline-hybrid.vim'
Plug 'rcmdnk/vim-markdown'
Plug 'joker1007/vim-markdown-quote-syntax'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tyru/open-browser.vim'
Plug 'Townk/vim-autoclose'
Plug 'LeafCage/yankround.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-migemo.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/vim-migemo'
Plug 'glidenote/memolist.vim'
" Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Shougo/denite.nvim'

Plug 'w0ng/vim-hybrid', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'cocopon/iceberg.vim', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'aereal/vim-colors-japanesque', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'jacoborus/tender.vim', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'tyrannicaltoucan/vim-deep-space', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'arcticicestudio/nord-vim', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'morhetz/gruvbox', {'do': 'cp colors/* ~/.vim/colors/'}

call plug#end()


" ----------------------------------------
" Plugin Settings
" ----------------------------------------
" Vaffle
let g:vaffle_auto_cd = 1
let g:vaffle_show_hidden_files = 1

" rcmdnk/vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_math=1
au BufRead,BufNewFile *.{txt,text} set filetype=markdown

hi link htmlItalic LineNr
hi link htmlBold WarningMsg
hi link htmlBoldItalic ErrorMsg


" vim-better-whitespace
highlight ExtraWhitespace ctermbg=DarkRed
highlight ExtraWhitespace guibg=DarkRed


" open-browser.vim
let g:netrw_nogx = 1

nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)


" vim-autoclose
" let b:AutoClosePairs = AutoClose#DefaultPairsModified("", "")


" yankround.vim
let g:yankround_max_history = 30
let g:yankround_use_region_hl = 0

nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)


" vim-easymotion
let g:EasyMotion_do_mapping = 0

let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_migemo = 1

let g:EasyMotion_startofline = 0
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1

let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTASDGZXCVBJF'

""" 1-key Find Motion
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

""" 2-key Find Motion
nmap s <Plug>(easymotion-overwin-f2)

""" JK Motion / Within Line Motion
map <Leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineanywhere)

map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

""" Word Motion
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

map  <Leader>W <Plug>(easymotion-bd-W)

""" n-key Find Motion


" incsearch.vim
let g:incsearch#auto_nohlsearch = 1

map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

""" incsearch-easymotion
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<C-l>": '<Over>(easymotion)'},
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

""" incsearch.vim x migemo x vim-easymotion
" function! s:config_migemo(...) abort
"   return extend(copy({
"   \   'converters': [incsearch#config#migemo#converter()],
"   \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
"   \   'keymap': {"\<C-l>": '<Over>(easymotion)'},
"   \   'is_expr': 0,
"   \ }), get(a:, 1, {}))
" endfunction
"
" noremap <silent><expr> m/ incsearch#go(<SID>config_migemo())
" noremap <silent><expr> m? incsearch#go(<SID>config_migemo({'command': '?'}))
" noremap <silent><expr> mg/ incsearch#go(<SID>config_migemo({'is_stay': 1}))


" memolist.vim

