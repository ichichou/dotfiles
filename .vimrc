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

if !has('nvim')
  unlet! skip_defaults_vim
  source $VIMRUNTIME/defaults.vim
endif

let g:no_vimrc_example = 1
let g:no_gvimrc_example = 1
let g:macvim_skip_colorscheme = 1
if has('gui_macvim')
  let g:macvim_skip_cmd_opt_movement = 1
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
set spelllang+=cjk
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
set shiftwidth=4
set softtabstop=-1

augroup vimrc
  autocmd FileType css setlocal tabstop=2 shiftwidth=2
  autocmd FileType go setlocal noexpandtab
  autocmd FileType html setlocal tabstop=2 shiftwidth=2
  autocmd FileType json setlocal tabstop=2 shiftwidth=2
  autocmd FileType lua setlocal tabstop=2 shiftwidth=2
  autocmd FileType nim setlocal tabstop=2 shiftwidth=2
  autocmd FileType r setlocal tabstop=2 shiftwidth=2
  autocmd FileType vim setlocal tabstop=2 shiftwidth=2
augroup END

augroup vimrc
  autocmd FileType gitcommit setlocal fileencoding=utf-8
  autocmd BufRead,BufNewFile *.{txt,text} setlocal filetype=markdown
augroup END

set diffopt=internal,filler,closeoff,vertical,indent-heuristic,algorithm:histogram

if !has('nvim')
  set mouse=a
  set ttymouse=xterm2
endif

" Appearance
" ========================================
set termguicolors

if !has('nvim')
  " True Color
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  " Undercurl
  let &t_Cs = "\e[4:3m"
  let &t_Ce = "\e[4:0m"

  " if has('vim_starting')
  "   " Corsor Style
  "   let &t_SI .= "\e[6 q"
  "   let &t_EI .= "\e[2 q"
  "   let &t_SR .= "\e[4 q"
  " endif
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

" set showmatch
set matchtime=1
set matchpairs+=（:）,「:」,『:』,〈:〉,《:》,【:】,〔:〕,［:］,｛:｝,‘:’,“:”

set nofoldenable
autocmd vimrc FileType vim setlocal foldmethod=marker

if !has('nvim')
  set laststatus=2
  set listchars=eol:¬,tab:»\ ,space:\ ,trail:\ ,nbsp:~,extends:>,precedes:<
  set fillchars+=vert:│
else
  set cmdheight=0
  set laststatus=3
  set listchars=eol:¬,tab:>\ ,space:\ ,trail:\ ,nbsp:~,extends:>,precedes:<
  " set fillchars+=horiz:━,horizup:┻,horizdown:┳,vert:┃,vertleft:┫,vertright:┣,verthoriz:╋,
endif

set statusline=%!SetStatusLine()

function! SetStatusLine() abort
  let fenc = &fileencoding != '' ? &fileencoding : &encoding
  let ft   = &filetype     != '' ? &filetype     : 'no ft'

  let p = line('.') * 100 / line('$')
  if p < 10
    let pp = '       ' . p . '%%'
  elseif p < 100
    let pp = '      ' . p . '%%'
  else
    let pp = '     ' . p . '%%'
  endif

  if line('.') < 10
    let l = '    %l:'
  elseif line('.') < 100
    let l = '   %l:'
  else
    let l = '  %l:'
  endif

  if col('.') < 10
    let c = '%c   '
  elseif col('.') < 100
    let c = '%c  '
  else
    let c = '%c '
  endif

  return ' %t %m%='
        \ . '%{&fileformat}' . ' | ' . fenc . ' | ' . ft
        \ . pp . l . c
endfunction

" Search & Completion
" ========================================
set hlsearch
set ignorecase
set smartcase
set gdefault

set completeopt=menuone,noinsert
set wildoptions=pum,tagfile
set pumheight=20
set shortmess+=cmrF

if !has('nvim')
  set shortmess+=c
  set shortmess-=S
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
nnoremap & :&&<CR>
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

noremap + <C-a>
noremap - <C-x>
noremap g+ g<C-a>
noremap g- g<C-x>
nnoremap U <C-r>
nnoremap <C-h> <C-^>
" inoremap <C-d> <Delete>

nnoremap <Esc><Esc> <Cmd>nohlsearch<CR>
nnoremap <Leader>e <Cmd>execute 'silent! !mvim --remote %' \| redraw!<CR>
inoremap <C-a> <Cmd>normal! ^<CR>
inoremap <C-e> <Cmd>normal! $<CR>
cnoremap <C-a> <C-b>
cnoremap <C-x> <C-r>=expand('%:p')<CR>

" Search & Completion
" ----------------------------------------
inoremap <expr> <CR> pumvisible() ? '<C-y>' : '<CR>'
inoremap <expr> <Tab> pumvisible() ? '<C-n>' : '<Tab>'
inoremap <expr> <S-Tab> pumvisible() ? '<C-p>' : '<S-Tab>'

" Window
" ----------------------------------------
nmap t <C-w>
nnoremap <C-w>. <Cmd>bnext<CR>
nnoremap <C-w>, <Cmd>bprevious<CR>

nmap <C-w>+ <C-w>+<SID>ws
nmap <C-w>- <C-w>-<SID>ws
nmap <C-w>> <C-w>><SID>ws
nmap <C-w>< <C-w><<SID>ws
nnoremap <script> <SID>ws+ <C-w>+<SID>ws
nnoremap <script> <SID>ws- <C-w>-<SID>ws
nnoremap <script> <SID>ws> <C-w>><SID>ws
nnoremap <script> <SID>ws< <C-w><<SID>ws
nmap <SID>ws <Nop>

" Quit by Q
" ----------------------------------------
augroup vimrc
  autocmd FileType help,qf,man,ref,diff,quickrun nnoremap <buffer> q <Cmd>quit!<CR>
  autocmd QuickFixCmdPost *grep*,make if len(getqflist()) != 0 | cwindow | endif
augroup END

" Markdown
" ----------------------------------------
augroup vimrc
  autocmd FileType markdown inoremap <buffer> <Tab> <C-t>
  autocmd FileType markdown inoremap <buffer> <S-Tab> <C-d>
  autocmd FileType markdown inoremap <buffer> <C-d> <Delete>
  autocmd FileType markdown setlocal comments=b:*,b:-,b:+,b:1.,nb:>
  autocmd FileType markdown setlocal formatoptions+=jro formatoptions-=c
augroup END

" Vimrc
" ----------------------------------------
nnoremap <Leader><Leader> <Cmd>edit $MYVIMRC<CR>
nnoremap <Leader>/ <Cmd>edit $HOME/dotfiles/vim/config<CR>

if has('gui_running')
  nnoremap <Leader><lt> <Cmd>edit $MYGVIMRC<CR>
  nnoremap <Leader>.
        \ <Cmd>source $MYVIMRC<CR><Cmd>source $MYGVIMRC<CR><Cmd>nohlsearch<CR>
else
  nnoremap <Leader>.
        \ <Cmd>source $MYVIMRC<CR><Cmd>nohlsearch<CR>
endif

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

" DiffOfig (Tweaked)
" ----------------------------------------
command! DiffOrig vertical new | set buftype=nofile filetype=diff
      \ | read ++edit # | 0delete_ | diffthis | wincmd p | diffthis

" Insert Blank Lines
" ----------------------------------------
nnoremap <expr> go <SID>blank_below()
nnoremap <expr> gO <SID>blank_above()

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

" Timestamp
" ----------------------------------------
augroup vimrc
  autocmd FileType markdown nnoremap <buffer> <Leader>d <Cmd>call <SID>timestamp_below()<CR>
  autocmd FileType markdown nnoremap <buffer> <Leader>D <Cmd>call <SID>timestamp_above()<CR>
augroup END

function! s:set_timestamp() abort
  let timestamp = '## ' . strftime('%Y-%m-%d %H:%M:%S')
  return timestamp
endfunction

function! s:timestamp_below() abort
  let timestamp = s:set_timestamp()
  let blank = nr2char(10)

  if strlen(getline('.')) > 0
    put =blank . timestamp
    put =blank
  elseif strlen(getline(line('.') - 1)) > 0
    put =timestamp
    put =blank
  else
    call append(line('.') - 1, timestamp)
  endif
  startinsert
endfunction

function! s:timestamp_above() abort
  let timestamp = s:set_timestamp()

  if strlen(getline('.')) > 0
    put! =timestamp
  else
    call setline(line('.'), timestamp)
  endif
endfunction

" Zk Journal
" ----------------------------------------
nnoremap <Leader>m <Nop>
nnoremap [zk] <Nop>
nmap <Leader>m [zk]
nnoremap [zk]n <Cmd>call <SID>open_journal_file()<CR>
nnoremap [zk]j <Cmd>call <SID>open_journal_dir()<CR>

let s:zk_dir = expand('$ZK_NOTEBOOK_DIR')
let s:journal_dir = s:zk_dir . '/journal'

function! s:open_journal_file() abort
  let file_name = strftime('%Y-%m-%d') . '.md'
  let file_path_pattern = 'zk/journal/' . file_name
  let win_id = bufwinid(file_path_pattern)

  if win_id > 0
    call win_gotoid(win_id)
  else
    execute 'edit' s:journal_dir . '/' . file_name
  endif
endfunction

function! s:open_journal_dir() abort
  execute 'edit' s:journal_dir
endfunction

" Syntax Info
" ----------------------------------------
function! s:get_syn_id(transparent)
  let synid = synID(line('.'), col('.'), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction

function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, 'name')
  let ctermfg = synIDattr(a:synid, 'fg', 'cterm')
  let ctermbg = synIDattr(a:synid, 'bg', 'cterm')
  let guifg = synIDattr(a:synid, 'fg', 'gui')
  let guibg = synIDattr(a:synid, 'bg', 'gui')
  return {
        \ 'name': name,
        \ 'ctermfg': ctermfg,
        \ 'ctermbg': ctermbg,
        \ 'guifg': guifg,
        \ 'guibg': guibg
        \ }
endfunction

function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo 'name: ' . baseSyn.name .
        \ ' ctermfg: ' . baseSyn.ctermfg .
        \ ' ctermbg: ' . baseSyn.ctermbg .
        \ ' guifg: ' . baseSyn.guifg .
        \ ' guibg: ' . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo 'link to'
  echo 'name: ' . linkedSyn.name .
        \ ' ctermfg: ' . linkedSyn.ctermfg .
        \ ' ctermbg: ' . linkedSyn.ctermbg .
        \ ' guifg: ' . linkedSyn.guifg .
        \ ' guibg: ' . linkedSyn.guibg
endfunction
command! -nargs=0 SyntaxInfo call s:get_syn_info()

" Auto No Cursorline
" ----------------------------------------
" augroup vimrc
"   autocmd VimEnter,BufWinEnter,WinEnter * setlocal cursorline
"   autocmd WinLeave * setlocal nocursorline
" augroup END

" Highlight on Yank
" ----------------------------------------
if has('nvim')
  autocmd vimrc TextYankPost * silent! lua
        \ vim.highlight.on_yank {higroup='Visual', timeout=200, on_visual=false}
endif

" Vertical Help
" ----------------------------------------
nnoremap gK <Cmd>call <SID>help_vertical_cword()<CR>
vnoremap gK <Cmd>call <SID>help_vertical_selected()<CR>

function! s:help_vertical_cword() abort
  let word = expand('<cword>')
  if word != ''
    execute 'vertical help' word
  endif
endfunction

function! s:help_vertical_selected() abort
  execute 'silent normal! "vy'
  let word = @v
  execute 'vertical help' word
endfunction

" Auto IME On/Off
" ----------------------------------------
augroup vimrc
  autocmd VimEnter * let s:prev_ime = ''
  autocmd InsertEnter * call s:restore_ime()
  autocmd InsertLeave * call s:save_ime_and_set_default_ime()
augroup END

let s:ime_cmd = 'macism'
let s:default_ime = 'jp.sourceforge.inputmethod.aquaskk.Ascii'

function! s:restore_ime() abort
  if s:prev_ime != '' && s:prev_ime != s:default_ime
    call system(s:ime_cmd . ' ' . s:prev_ime)
  endif
endfunction

function! s:save_ime_and_set_default_ime() abort
  let s:prev_ime = system(s:ime_cmd)
  if s:prev_ime != s:default_ime
    call system(s:ime_cmd . ' ' . s:default_ime)
  endif
endfunction

" Hankaku/Zenkaku
" ----------------------------------------
" runtime! scripts/hz_ja.vim

" Plugins
" ========================================
let g:data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if !has('nvim')
  call plug#begin('~/.vim/plugged')
else
  call plug#begin(stdpath('data') . '/plugged')
endif

" Language Server
" ----------------------------------------
if !has('nvim')
  " Plug 'prabirshrestha/asyncomplete.vim'
  " Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  Plug 'mattn/vim-lsp-icons'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'
endif

" Completion
" ----------------------------------------
if !has('nvim')
  Plug 'vim-denops/denops.vim'
  Plug 'Shougo/pum.vim'
  Plug 'Shougo/ddc.vim'
  " Plug 'Shougo/ddc-ui-native'
  Plug 'Shougo/ddc-ui-pum'
  Plug 'Shougo/ddc-source-around'
  Plug 'shun/ddc-source-vim-lsp'
  Plug 'Shougo/ddc-source-omni'
  Plug 'Shougo/ddc-source-cmdline'
  Plug 'Shougo/ddc-source-cmdline-history'
  Plug 'Shougo/ddc-matcher_head'
  Plug 'Shougo/ddc-sorter_rank'
  Plug 'Shougo/ddc-converter_remove_overlap'
endif

" Language
" ----------------------------------------
if !has('nvim')
  let g:polyglot_disabled = ['markdown.plugin', 'csv.plugin', 'r-lang.plugin']
  " let g:polyglot_disabled = ['sensible', 'markdown.plugin', 'csv.plugin', 'r-lang.plugin']
  Plug 'sheerun/vim-polyglot'
else
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif

Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'mechatroner/rainbow_csv', {'for': 'csv'}
Plug 'prettier/vim-prettier', {'do': 'yarn install --frozen-lockfile --production', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html']}
Plug 'previm/previm', {'for': 'markdown'}
Plug 'vim-jp/syntax-vim-ex', {'for': 'vim'}

Plug 'godlygeek/tabular'
Plug 'rcmdnk/vim-markdown', {'for': 'markdown'}

" Editing
" ----------------------------------------
Plug 'AndrewRadev/linediff.vim'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'cocopon/vaffle.vim'
Plug 'cohama/lexima.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/vim-asterisk'
Plug 'haya14busa/vim-edgemotion'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'kana/vim-niceblock'
Plug 'kana/vim-repeat'
Plug 'machakann/vim-sandwich'
Plug 'mattn/vim-maketable'
Plug 'rcmdnk/yankround.vim'
Plug 'thinca/vim-quickrun'
Plug 'tyru/caw.vim'
Plug 'tyru/open-browser.vim'

packadd! matchit
set runtimepath+=/opt/homebrew/opt/fzf
Plug 'junegunn/fzf.vim'

" if !has('nvim')
"   Plug 'machakann/vim-highlightedyank'
" endif

" Appearance
" ----------------------------------------
Plug 'haya14busa/is.vim'
Plug 'itchyny/vim-highlighturl'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rbtnn/vim-ambiwidth'

if !has('nvim')
  " Plug 'cocopon/lightline-hybrid.vim'
  Plug 'delphinus/vim-auto-cursorline'
  Plug 'itchyny/lightline.vim'
else
  Plug 'MunifTanjim/nui.nvim'
  " Plug 'rcarriga/nvim-notify'
  Plug 'folke/noice.nvim'
  Plug 'delphinus/auto-cursorline.nvim'
endif

" Operator & Text Object
" ----------------------------------------
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'

Plug 'kana/vim-operator-replace'
Plug 'kana/vim-textobj-line'

if !has('nvim')
  Plug 'haya14busa/vim-operator-flashy'
  Plug 'kana/vim-textobj-entire'
endif

" Japanese Support
" ----------------------------------------
" Plug 'brglng/vim-im-select'
Plug 'deton/jasegment.vim'
Plug 'deton/jasentence.vim'
Plug 'haya14busa/vim-migemo'
Plug 'mattn/learn-vimscript'
Plug 'vim-jp/vimdoc-ja'

" Colorscheme
" ----------------------------------------
" Plug 'arcticicestudio/nord-vim'
Plug 'EdenEast/nightfox.nvim'
" Plug 'cocopon/iceberg.vim'
Plug 'sainnhe/edge'
Plug 'sainnhe/everforest'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/sonokai'
Plug 'shaunsingh/nord.nvim'
" Plug 'w0ng/vim-hybrid'

call plug#end()

" Colorscheme Config
" ----------------------------------------
runtime! config/colorscheme.vim

" Plugin Config
" ----------------------------------------
let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
  return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif

runtime! config/config-*.vim
if has('nvim')
  runtime! config/config-*.lua
endif
