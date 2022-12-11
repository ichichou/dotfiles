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

language messages en_US.UTF-8
language time en_US.UTF-8

augroup vimrc
    autocmd!
augroup END

if ! has('nvim')
    unlet! skip_defaults_vim
    source $VIMRUNTIME/defaults.vim
endif

let g:did_install_default_menus = 1
let g:did_install_syntax_menu   = 1
let g:loaded_2html_plugin       = 1
let g:loaded_getscript          = 1
let g:loaded_getscriptPlugin    = 1
let g:loaded_gzip               = 1
let g:loaded_netrw              = 1
let g:loaded_netrwFileHandlers  = 1
let g:loaded_netrwPlugin        = 1
let g:loaded_netrwSettings      = 1
let g:loaded_rrhelper           = 1
let g:loaded_tar                = 1
let g:loaded_tarPlugin          = 1
let g:loaded_vimball            = 1
let g:loaded_vimballPlugin      = 1
let g:loaded_zip                = 1
let g:loaded_zipPlugin          = 1
let g:skip_loading_mswin        = 1

" Editing
" ========================================
set hidden
set autoread
set switchbuf=usetab,uselast

set noswapfile
set nowritebackup

set shell=fish
set history=10000
set helplang=ja,en
set nrformats=bin,hex
set clipboard=unnamed,unnamedplus
set ttyfast

set textwidth=0
set virtualedit=onemore
set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
set nostartofline

set autoindent
set smartindent
set breakindent

set expandtab
set smarttab
set shiftround
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

augroup vimrc
    autocmd FileType gitcommit setlocal fileencoding=utf-8
    autocmd BufRead,BufNewFile *.{txt,text} setlocal filetype=markdown
augroup END

set diffopt=internal,filler,closeoff,vertical,indent-heuristic,algorithm:histogram

if ! has('nvim')
    set mouse=a
    set ttymouse=xterm2
endif

" Appearance
" ========================================
set termguicolors

if ! has('nvim')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    let &t_Cs = "\e[4:3m"
    let &t_Ce = "\e[4:0m"

    if has('vim_starting')
        let &t_SI .= "\e[6 q"
        let &t_EI .= "\e[2 q"
        let &t_SR .= "\e[4 q"
    endif
endif

set title
set number
set signcolumn=yes
set cursorline
set noshowmode
set display=lastline
set list

set sidescroll=1
set scrolloff=5
set sidescrolloff=5
set updatetime=100
set belloff=all

set showmatch
set matchtime=1
set matchpairs+=（:）,「:」,『:』,〈:〉,《:》,【:】,〔:〕,［:］,｛:｝,‘:’,“:”

set nofoldenable
autocmd vimrc FileType vim setlocal foldmethod=marker

if has('nvim')
    set cmdheight=0
    set laststatus=3
    " set winbar=%f
    set listchars=eol:¬,tab:>\ ,space:\ ,trail:-,nbsp:+,extends:>,precedes:<
else
    set laststatus=2
    set listchars=eol:¬,tab:»\ ,space:\ ,trail:\ ,nbsp:~,extends:>,precedes:<
endif

" Search & Completion
" ========================================
set hlsearch
set ignorecase
set smartcase
set gdefault

set wildoptions=pum,tagfile
set pumheight=10
set shortmess+=mrF
set shortmess-=S

if has('nvim')
    set completeopt=menuone,noinsert
else
    set completeopt=menuone,noinsert,popup
endif

if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Keymap
" ========================================

"        Normal  Visual  Insert  Command  Terminal
"        ------  ------  ------  -------  --------
"  map   x       x
"  map!                  x       x
"  nmap  x
"  vmap          x
"  imap                  x
"  cmap                          x
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
noremap x "_x
noremap X "_X
nnoremap Y y$
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

noremap + <C-a>
noremap - <C-x>
nnoremap U <C-r>
nnoremap <C-h> <C-^>

nnoremap <silent> <Esc><Esc> <Cmd>nohlsearch<CR>
nnoremap <silent> <Leader>t <Cmd>terminal ++close<CR>
" nnoremap <silent> <C-> <Cmd>bnext<CR>
" nnoremap <silent> <C-> <Cmd>bprevious<CR>
" Quit by Q
" ----------------------------------------
augroup vimrc
    autocmd FileType help,qf,man,ref,diff nnoremap <silent> <buffer> q <Cmd>quit!<CR>
    autocmd QuickFixCmdPost *grep*,make if len(getqflist()) != 0 | cwindow | endif
augroup END

" Markdown
" ----------------------------------------
augroup vimrc
    autocmd FileType markdown inoremap <buffer> <Tab> <C-t>
    autocmd FileType markdown inoremap <buffer> <S-Tab> <C-d>
    autocmd FileType markdown inoremap <buffer> <C-d> <Delete>
    autocmd FileType markdown
    \ nnoremap <buffer> <Leader>d o## <C-r>=strftime('%Y-%m-%d %H:%M:%S')<CR><CR>
    autocmd FileType markdown
    \ nnoremap <buffer> <Leader>D o<CR>## <C-r>=strftime('%Y-%m-%d %H:%M:%S')<CR><CR>
augroup END

" Vimrc
" ----------------------------------------
nnoremap <silent> <Leader><Leader> <Cmd>edit $MYVIMRC<CR>
nnoremap <silent> <Leader>/ <Cmd>edit $HOME/dotfiles/vim/config<CR>

if has('gui_running')
    nnoremap <silent> <Leader><lt> <Cmd>edit $MYGVIMRC<CR>
    nnoremap <silent> <Leader>. <Cmd>source $MYVIMRC<CR><Cmd>source $MYGVIMRC<CR>
else
    nnoremap <silent> <Leader>. <Cmd>source $MYVIMRC<CR>
endif

" Window & Tabpage
" ----------------------------------------
nnoremap t <Nop>
nnoremap [window] <Nop>
nmap t [window]

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
nnoremap <silent> [window]t <Cmd>tabnew<CR>
nnoremap <silent> [window]q <Cmd>tabclose<CR>
nnoremap <silent> [window]N <Cmd>+tabmove<CR>
nnoremap <silent> [window]P <Cmd>-tabmove<CR>

" Nop
" ----------------------------------------
noremap ZZ <Nop>
noremap ZQ <Nop>
noremap Q <Nop>
noremap gQ <Nop>
noremap <Del> <Nop>

noremap <C-j> <Nop>
noremap <C-l> <Nop>
noremap! <C-j> <Nop>
noremap! <C-l> <Nop>

inoremap <D-a> <Nop>
inoremap <D-i> <Nop>

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

" Command & Function
" ========================================

" Diff Mode
" ----------------------------------------
function! s:set_diff_mode() abort
    if &diff
        setlocal nospell
        setlocal wrap<
    endif
endfunction
autocmd vimrc VimEnter,DiffUpdated * call s:set_diff_mode()

" Insert Blank Lines
" ----------------------------------------
function! s:blank_below(type = '') abort
    if a:type == ''
        set operatorfunc=function('s:blank_below')
        return 'g@ '
    endif

    for i in range(v:count1)
        call append(line('.'), '')
    endfor
endfunction

function! s:blank_above(type = '') abort
    if a:type == ''
        set operatorfunc=function('s:blank_above')
        return 'g@ '
    endif

    for i in range(v:count1)
        call append(line('.') - 1, '')
    endfor
endfunction

nnoremap <expr> go <SID>blank_below()
nnoremap <expr> gO <SID>blank_above()

" Time Stamp
" ----------------------------------------
" function! s:put_timestamp() abort
"     let l:timestamp = '## ' .. strftime('%Y-%m-%d %H:%M:%S')
"     let l:blank = nr2char(10)
"
"     if strlen(getline('.')) > 0
"         put =l:blank .. l:timestamp .. l:blank
"         normal! i
"     elseif strlen(getline(line('.') - 1)) > 0
"         put =l:timestamp .. l:blank
"         normal! i
"     else
"         call append(getline('.') - 1, l:timestamp)
"         normal! i
"     endif
" endfunction
"
" autocmd vimrc FileType markdown nnoremap <expr> <buffer> <Leader>d <SID>put_timestamp()

" Plugins
" ========================================
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if has('nvim')
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

" Vim-Polyglot
" ----------------------------------------
let g:polyglot_disabled = ['markdown.plugin', 'csv.plugin', 'r-lang.plugin']
Plug 'sheerun/vim-polyglot'

" Language Server
" ----------------------------------------
if ! has('nvim')
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'mattn/vim-lsp-icons'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    " Plug 'vim-denops/denops.vim'
    " Plug 'Shougo/ddc.vim'
    " Plug 'shun/ddc-vim-lsp'
endif

" Language
" ----------------------------------------
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'mechatroner/rainbow_csv', {'for': 'csv'}
Plug 'prettier/vim-prettier', {'do': 'yarn install --frozen-lockfile --production', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html']}
Plug 'previm/previm', {'for': 'markdown'}
Plug 'vim-jp/syntax-vim-ex', {'for': 'vim'}

Plug 'godlygeek/tabular'
Plug 'joker1007/vim-markdown-quote-syntax', {'for': 'markdown'}
Plug 'rcmdnk/vim-markdown', {'for': 'markdown'}

" Edditing
" ----------------------------------------
Plug 'LeafCage/yankround.vim'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'cocopon/vaffle.vim'
Plug 'cohama/vim-smartinput-endwise'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/vim-asterisk'
Plug 'kana/vim-niceblock'
Plug 'kana/vim-repeat'
Plug 'kana/vim-smartinput'
Plug 'mattn/vim-maketable'
Plug 'tyru/caw.vim'
Plug 'tyru/open-browser.vim'

packadd! matchit
set runtimepath+=/opt/homebrew/opt/fzf
Plug 'junegunn/fzf.vim'

" Appearance
" ----------------------------------------
Plug 'haya14busa/is.vim'
Plug 'itchyny/vim-highlighturl'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rbtnn/vim-ambiwidth'

if has('nvim')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'MunifTanjim/nui.nvim'
    " Plug 'rcarriga/nvim-notify'
    Plug 'folke/noice.nvim'
else
    Plug 'cocopon/lightline-hybrid.vim'
    Plug 'itchyny/lightline.vim'
endif

" Operator / Text Object
" ----------------------------------------
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'
Plug 'kana/vim-operator-replace'
Plug 'rhysd/vim-operator-surround'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'

" Japanese Support
" ----------------------------------------
Plug 'brglng/vim-im-select'
Plug 'deton/jasegment.vim'
Plug 'deton/jasentence.vim'
Plug 'haya14busa/vim-migemo'

if ! has('nvim')
    Plug 'vim-jp/vimdoc-ja'
endif

" Colorscheme
" ----------------------------------------
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'
Plug 'jacoborus/tender.vim'
Plug 'sainnhe/everforest'
Plug 'sainnhe/sonokai'
Plug 'w0ng/vim-hybrid'

call plug#end()

" Plugin Config
" ----------------------------------------
let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
    return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif

runtime! config/config-*.vim
