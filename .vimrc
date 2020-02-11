" ========================================
" .vimrc
" ========================================

set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,sjis
" set fileencodings=utf=8,iso-2022-jp,cp932,euc-jp,sjis
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
    autocmd FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" ----------------------------------------
" Appearance
" ----------------------------------------

" set termguicolors
set background=dark
colorscheme iceberg
" hybrid iceberg nord tender

set list
set listchars=eol:¬,tab:»\ ,space:\ ,trail:\ ,extends:>,precedes:<,nbsp:~

set title
set number
set cursorline
set nocursorcolumn

set showtabline=1
set laststatus=2
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
set matchpairs+=（:）,［:］,｛:｝,「:」,『:』,〈:〉,【:】,〔:〕

source $VIMRUNTIME/macros/matchit.vim
let b:match_ignorecase = 1
" let b:match_words = "<if>:<endif>"

" ----------------------------------------
" Search/Completion
" ----------------------------------------

set incsearch
set hlsearch
set ignorecase
set smartcase
" set infercase
set gdefault
set wrapscan

set wildmenu
set wildmode=full
set completeopt=menuone,popup
set pumheight=10

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

augroup vimrc
    autocmd FileType help,qf,man,ref nnoremap <silent> <buffer> q :q!<CR>
    autocmd QuickFixCmdPost *grep*,make if len(getqflist()) != 0 | cwindow | endif
augroup END

" ----------------------------------------
" Plugins
" ----------------------------------------

if empty(glob('~/.vim/pack/minpac/opt/minpac'))
    silent !git clone https://github.com/k-takata/minpac.git
    \ ~/.vim/pack/minpac/opt/minpac
endif

if exists('*minpac#init')
    call minpac#init()
    call minpac#add('k-takata/minpac', {'type': 'opt'})

    " General
    " --------------------
    call minpac#add('LeafCage/yankround.vim')
    call minpac#add('airblade/vim-gitgutter')
    call minpac#add('alvan/vim-closetag')
    call minpac#add('cocopon/lightline-hybrid.vim')
    call minpac#add('cocopon/vaffle.vim')
    call minpac#add('easymotion/vim-easymotion')
    call minpac#add('glidenote/memolist.vim')
    call minpac#add('godlygeek/tabular')
    call minpac#add('haya14busa/is.vim')
    call minpac#add('haya14busa/vim-asterisk')
    call minpac#add('itchyny/lightline.vim')
    call minpac#add('itchyny/vim-highlighturl')
    call minpac#add('junegunn/fzf.vim')
    call minpac#add('ntpeters/vim-better-whitespace')
    call minpac#add('tpope/vim-fugitive')
    call minpac#add('tpope/vim-repeat')
    call minpac#add('tyru/caw.vim')
    call minpac#add('tyru/open-browser.vim')
    " call minpac#add('kana/vim-repeat')

    call minpac#add('kana/vim-smartinput')
    call minpac#add('cohama/vim-smartinput-endwise')

    " Operator / Text Object
    " --------------------
    call minpac#add('kana/vim-operator-user')
    call minpac#add('haya14busa/vim-operator-flashy')
    call minpac#add('kana/vim-operator-replace')
    call minpac#add('rhysd/vim-operator-surround')

    call minpac#add('kana/vim-textobj-user')
    call minpac#add('kana/vim-textobj-entire')
    call minpac#add('kana/vim-textobj-line')

    " Language
    " --------------------
    call minpac#add('sheerun/vim-polyglot')
    call minpac#add('dense-analysis/ale')
    call minpac#add('mattn/emmet-vim')
    call minpac#add('aklt/plantuml-syntax', {'type': 'opt'})
    call minpac#add('mechatroner/rainbow_csv', {'type': 'opt'})
    call minpac#add('prettier/vim-prettier', {'type': 'opt'})
    call minpac#add('previm/previm', {'type': 'opt'})
    call minpac#add('vim-jp/syntax-vim-ex', {'type': 'opt'})
    " call minpac#add('dagwieers/asciidoc-vim', {'type': 'opt'})

    call minpac#add('joker1007/vim-markdown-quote-syntax', {'type': 'opt'})
    call minpac#add('rcmdnk/vim-markdown', {'type': 'opt'})

    " Japanese Support
    " --------------------
    call minpac#add('deton/jasegment.vim')
    call minpac#add('deton/jasentence.vim')
    call minpac#add('haya14busa/vim-migemo')
    call minpac#add('vim-jp/vimdoc-ja')

    " Colorscheme
    " --------------------
    call minpac#add('arcticicestudio/nord-vim', {'type': 'opt'})
    call minpac#add('cocopon/iceberg.vim', {'type': 'opt'})
    call minpac#add('jacoborus/tender.vim', {'type': 'opt'})
    call minpac#add('kristijanhusak/vim-hybrid-material', {'type': 'opt'})
    call minpac#add('w0ng/vim-hybrid', {'type': 'opt'})
endif

augroup vimrc
    autocmd FileType csv packadd rainbow_csv
    autocmd FileType html,json,javascript,yaml,markdown packadd vim-prettier
    autocmd FileType markdown packadd previm
    autocmd FileType markdown packadd vim-markdown
    autocmd FileType markdown packadd vim-markdown-quote-syntax
    autocmd FileType plantuml packadd plantuml-syntax
    autocmd FileType vim packadd syntax-vim-ex
    " autocmd FileType asciidoc packadd asciidoc-vim
augroup END

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

call map(sort(split(globpath(&runtimepath, 'config/*.vim'))), {->[execute('exec "so" v:val')]})
