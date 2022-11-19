" ========================================
" Neovim
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
let g:loaded_netrw              = 1
let g:loaded_netrwPlugin        = 1
let g:loaded_netrwSettings      = 1
let g:loaded_netrwFileHandlers  = 1
let g:did_install_default_menus = 1
let g:skip_loading_mswin        = 1
let g:did_install_syntax_menu   = 1
let g:loaded_2html_plugin       = 1


" Editing
" ========================================

set hidden
set autoread
set switchbuf=usetab

set noswapfile
set nobackup
set nowritebackup

set shell=fish
set history=10000
set updatetime=100
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
    autocmd FileType go setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
    autocmd FileType html,css setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType nim setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType r setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

autocmd vimrc FileType gitcommit setlocal fileencoding=utf-8

packadd! matchit
let b:match_ignorecase = 1


" Appearance
" ========================================

set termguicolors

set background=dark

set list
set listchars=eol:¬,tab:»\ ,space:\ ,trail:\ ,extends:>,precedes:<,nbsp:~

set title
set number
set ruler
set cursorline
set nocursorcolumn

set signcolumn=yes
set laststatus=2
set cmdheight = 0
set showtabline=1
set showcmd
set noshowmode

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
set matchpairs+=「:」,（:）,『:』,〈:〉,《:》,【:】,〔:〕,［:］,｛:｝,“:”,‘:’


" Search/Completion
" ========================================

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
set completeopt=menuone,noinsert
" set completeopt=menuone,noinsert,popup
set shortmess-=S
" set shortmess+=c

if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

augroup vimrc
    autocmd FileType help,qf,man,ref,diff nnoremap <silent> <buffer> q :q!<CR>
    autocmd QuickFixCmdPost *grep*,make if len(getqflist()) != 0 | cwindow | endif
augroup END


" Keymaps
" ========================================

"        Normal  Insert  Command  Visual  Terminal
"        ------  ------  -------  ------  --------
"  map   x                        x
"  map!          x       x
"  nmap  x
"  imap          x
"  cmap                  x
"  vmap                           x
"  tmap                                   x

let g:mapleader = ','
" let g:maplocalleader = ''

noremap \ ,
noremap ; :
noremap : ;

noremap j gj
noremap k gk
noremap gj j
noremap gk k

noremap Y y$
noremap x "_x
noremap X "_X

noremap U <C-r>

noremap + <C-a>
noremap - <C-x>

noremap <C-h> <C-^>
" noremap <C-j> :<C-u>bprevious<CR>
" noremap <C-k> :<C-u>bnext<CR>

cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

nnoremap <CR> i<CR><Esc>

" set termwinkey=<C-g>
" tnoremap <F1> <C-\><C-n>

augroup vimrc
    autocmd FileType markdown inoremap <Tab> <C-t>
    autocmd FileType markdown inoremap <S-Tab> <C-d>
    autocmd FileType markdown inoremap <C-d> <Delete>
augroup END

if has('gui_running')
    nnoremap <silent> <Leader><Leader> :<C-u>edit $MYVIMRC<CR>
    nnoremap <silent> <Leader><lt> :<C-u>edit $MYGVIMRC<CR>
    nnoremap <silent> <Leader>. :<C-u>source $MYVIMRC<CR> :source $MYGVIMRC<CR>
else
    nnoremap <silent> <Leader><Leader> :<C-u>edit $MYVIMRC<CR>
    nnoremap <silent> <Leader>. :<C-u>source $MYVIMRC<CR>
endif

nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>
" nnoremap <silent> <Leader>r :<C-u>redraw!<CR>
nnoremap <silent> <Leader>t :<C-u>vertical terminal ++close<CR>

nnoremap <Leader>d o## <C-R>=strftime('%Y-%m-%d %H:%M:%S')<CR><CR>
nnoremap <Leader>D o<CR>## <C-R>=strftime('%Y-%m-%d %H:%M:%S')<CR><CR>

" --------------------
" Nop
" --------------------
noremap ZZ <Nop>
noremap ZQ <Nop>
noremap Q <Nop>
noremap gQ <Nop>
noremap <Del> <Nop>

inoremap <C-j> <Nop>
inoremap <C-l> <Nop>

inoremap <D-0> <Nop>
inoremap <D-1> <Nop>
inoremap <D-2> <Nop>
inoremap <D-3> <Nop>
inoremap <D-4> <Nop>
inoremap <D-5> <Nop>
inoremap <D-6> <Nop>
inoremap <D-7> <Nop>
inoremap <D-8> <Nop>
inoremap <D-9> <Nop>
inoremap <D-a> <Nop>
inoremap <D-i> <Nop>

" --------------------
" Insert Blank Line
" --------------------
nnoremap <silent> go :<C-u>for i in range(1, v:count1) \|
\ call append(line('.'), '') \| endfor \|
\ silent! call repeat#set('go', v:count1)<CR>

nnoremap <silent> gO :<C-u>for i in range(1, v:count1) \|
\ call append(line('.')-1, '') \| endfor \|
\ silent! call repeat#set('gO', v:count1)<CR>

" --------------------
" Window/Tabpage/Buffer
" --------------------
nnoremap t <Nop>
nnoremap [window] <Nop>
nmap t [window]

nnoremap [window]/ :<C-u>vertical help<Space>

nnoremap [window]s <C-w>s
nnoremap [window]v <C-w>v
nnoremap [window]= <C-w>=

nnoremap [window]h <C-w>h
nnoremap [window]j <C-w>j
nnoremap [window]k <C-w>k
nnoremap [window]l <C-w>l

nnoremap [window]H <C-w>H
nnoremap [window]J <C-w>J
nnoremap [window]K <C-w>K
nnoremap [window]L <C-w>L

nnoremap [window]n gt
nnoremap [window]p gT
nnoremap <silent> [window]t :<C-u>tabnew<CR>
nnoremap <silent> [window]q :<C-u>tabclose<CR>
nnoremap <silent> [window]N :<C-u>+tabmove<CR>
nnoremap <silent> [window]P :<C-u>-tabmove<CR>


" Commands
" ========================================

" --------------------
" Diff
" --------------------
set diffopt=internal,filler,vertical,indent-heuristic,algorithm:histogram

function! SetDiffMode()
    if &diff
        setlocal nospell
        setlocal wrap<
    endif
endfunction

augroup vimrc
    autocmd VimEnter,FilterWritePre * call SetDiffMode()
    autocmd WinEnter * if(winnr('$') == 1) &&
    \ (getbufvar(winbufnr(0), '&diff')) == 1 | diffoff | endif
augroup END

command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
\ | wincmd p | diffthis


" Plugins
" ========================================
