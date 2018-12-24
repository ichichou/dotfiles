" ========================================
" .vimrc
" ========================================
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8,euc-jp,sjis
set fileformats=unix,dos,mac

filetype plugin indent on
syntax enable

augroup vimrc
  autocmd!
augroup END


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

if has('win64') || has('win32')
  set shellslash
endif


" ----------------------------------------
" Appearance
" ----------------------------------------
set background=dark
set termguicolors

set title
set number
set cursorline

set showmatch
set matchtime=1
set matchpairs+=（:）,［:］,｛:｝,「:」,『:』,〈:〉,【:】,〔:〕

set showtabline=1
set laststatus=2
set noshowmode
set showcmd
set ruler

set display=lastline
set scrolloff=5
set breakindent

set belloff=all

set list
set listchars=eol:¬,tab:»\ ,trail:\ ,extends:>,precedes:<,nbsp:~
set ambiwidth=double


" GUI Options
" --------------------
if has('gui_running')
  set guioptions+=c
  set guioptions-=e
  set guioptions-=m
  set guioptions-=r
  set guioptions-=L
  set guioptions-=t
  set guioptions-=T
  set guicursor+=a:blinkon0

  if has('win64') || has('win32')
    set guifont=Myrica\ Monospace:h12
    " set guifontwide=
    set columns=140
    set lines=50
    set linespace=2
    set renderoptions=type:directx,renmode:5
  else
    set guifont=Myrica\ Monospace:h14
    " set guifontwide=
    set columns=140
    set lines=50
    set linespace=2
  endif
endif

if has('gui_macvim')
  let g:macvim_skip_colorscheme=1
  let g:no_gvimrc_example=1
endif


" ----------------------------------------
" Edit
" ----------------------------------------
set tabstop=4
set softtabstop=4
set shiftwidth=4

augroup fileTypeIndent
  autocmd!
  autocmd FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType markdown setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

set expandtab
set smarttab
set autoindent
set smartindent
set shiftround

set textwidth=0
" set virtualedit=onemore
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set clipboard=unnamed

set nrformats-=octal

set mouse=a
set ttymouse=xterm2


" ----------------------------------------
" Search/Completion
" ----------------------------------------
set wrapscan
set incsearch
set hlsearch
set ignorecase
set smartcase
set gdefault

set wildmenu
set wildmode=full
set history=10000

set completeopt=menu,menuone,preview
set pumheight=20
set infercase


" ----------------------------------------
" Keymap
" ----------------------------------------

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
noremap \ ,

noremap ; :
noremap : ;
noremap / /\v

noremap Y y$
noremap x "_x
noremap X "_X

noremap <silent> j gj
noremap <silent> k gk
noremap <silent> gj j
noremap <silent> gk k

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

set termwinkey=<C-l>
tnoremap <F1> <C-\><C-n>

nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>
nnoremap <silent> <Leader>r :<C-u>redraw!<CR>
nnoremap <silent> <Leader>t :<C-u>vertical terminal fish<CR>
nnoremap <silent> <Leader>. :<C-u>source $MYVIMRC<CR>
nnoremap <silent> <Leader><Leader> :<C-u>edit $MYVIMRC<CR>

noremap ZZ <Nop>
noremap ZQ <Nop>
noremap Q <Nop>
noremap gQ <Nop>


" 空行の挿入
" --------------------
nnoremap <silent> go :<C-u>for i in range(1, v:count1) \| call append(line('.'), '') \| endfor \| silent! call repeat#set("go", v:count1)<CR>
nnoremap <silent> gO :<C-u>for i in range(1, v:count1) \| call append(line('.')-1, '') \| endfor \| silent! call repeat#set("gO", v:count1)<CR>


" Window
" --------------------
nnoremap t <Nop>
nnoremap [window] <Nop>
nmap t [window]

nnoremap [window]o :<C-u>edit<Space>
nnoremap [window]/ :<C-u>vertical help<Space>

nnoremap <silent> [window]s :<C-u>split<CR>
nnoremap <silent> [window]v :<C-u>vsplit<CR>

nnoremap [window]= <C-w>=

nnoremap [window]t <C-w>w
nnoremap [window]h <C-w>h
nnoremap [window]j <C-w>j
nnoremap [window]k <C-w>k
nnoremap [window]l <C-w>l

nnoremap [window]H <C-w>H
nnoremap [window]J <C-w>J
nnoremap [window]K <C-w>K
nnoremap [window]L <C-w>L



" ----------------------------------------
" vim-plug
" ----------------------------------------
if has('mac')
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif

call plug#begin('~/.vim/plugged')

" Generals
" --------------------
Plug 'vim-jp/vimdoc-ja'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-highlighturl'
Plug 'cocopon/vaffle.vim'
Plug 'cocopon/lightline-hybrid.vim'
Plug 'godlygeek/tabular'
Plug 'gabrielelana/vim-markdown'
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-repeat'
Plug 'LeafCage/yankround.vim'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/is.vim'
Plug 'haya14busa/vim-migemo'
Plug 'glidenote/memolist.vim'
Plug 'deton/jasentence.vim'
Plug 'deton/jasegment.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv', { 'on': [ 'Gitv' ] }

" Operator/Text Object
" --------------------
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-operator-replace'
Plug 'rhysd/vim-operator-surround'
Plug 'haya14busa/vim-operator-flashy'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'

" Colorscheme
" --------------------
Plug 'w0ng/vim-hybrid', { 'do': 'cp colors/* ~/.vim/colors/' }
Plug 'cocopon/iceberg.vim', { 'do': 'cp colors/* ~/.vim/colors/' }
Plug 'jacoborus/tender.vim', { 'do': 'cp colors/* ~/.vim/colors/' }
Plug 'tyrannicaltoucan/vim-deep-space', { 'do': 'cp colors/* ~/.vim/colors/' }
Plug 'arcticicestudio/nord-vim', { 'do': 'cp colors/* ~/.vim/colors/' }
Plug 'ajh17/Spacegray.vim', { 'do': 'cp colors/* ~/.vim/colors/' }

call plug#end()


" ----------------------------------------
" Plugins
" ----------------------------------------

" Colorschemes
" --------------------
colorscheme iceberg
" hybrid iceberg tender deep-space nord spacegray

let g:hybrid_custom_term_colors = 1
" let g:lightline_hybrid_style = 'plain'

let g:spacegray_use_italics = 1
let g:spacegray_underline_search = 1


" Lightline
" --------------------
" powerline wombat jellybeans solarized PaperColor seoul256 Dracula one landscape
" hybrid iceberg tender tenderplus deepspace nord

let g:lightline = {
  \ 'colorscheme': 'iceberg',
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'readonly', 'filepath', 'modified' ] ],
  \   'right': [
  \     [ 'lineinfo' ],
  \     [ 'percent' ],
  \     [ 'fileformat', 'fileencoding', 'filetype' ] ]
  \ },
  \ 'component': {
  \   'percent': '%3p%% [%LL]'
  \ },
  \ 'component_function': {
  \   'filepath': 'FilePath'
  \ }}

function! FilePath()
  if winwidth(0) > 70
    return expand('%:s')
  else
    return expand('%:t')
  endif
endfunction

let g:lightline.tabline = {
  \ 'left': [ [ 'tabs' ] ],
  \ 'right': [ [ '' ] ]
  \ }


" Vaffle
" --------------------
let g:vaffle_auto_cd = 1
let g:vaffle_show_hidden_files = 1

nnoremap <silent> <Leader>v :<C-u>Vaffle<CR>


" gabrielelana/vim-markdown
" --------------------
let g:markdown_enable_spell_checking = 0

imap <D-]> <Tab>
imap <D-[> <S-Tab>

" highlight link htmlItalic LineNr
" highlight link htmlBold WarningMsg
" highlight link htmlBoldItalic ErrorMsg


" Previm
" --------------------
let g:previm_enable_realtime = 1
let g:previm_show_header = 0
let g:previm_disable_default_css = 0
" let g:previm_custom_css_path = ''

nnoremap <silent> <Leader>p :<C-u>PrevimOpen<CR>


" open-browser
" --------------------
let g:netrw_nogx = 1

map gx <Plug>(openbrowser-smart-search)


" better-whitespace
" --------------------
let g:better_whitespace_filetypes_blacklist = [ 'diff', 'gitcommit', 'help' ]

highlight ExtraWhitespace ctermbg=DarkRed
highlight ExtraWhitespace guibg=DarkRed


" jasegment
" --------------------
call jasegment#define(
  \ 'nonblank', {
  \   'move-n': 'gW',
  \   'move-p': 'gB',
  \   'move-N': 'gE',
  \   'select-i': 'iE',
  \   'select-a': 'aE',
  \ })


" yankround
" --------------------
let g:yankround_max_history = 50
let g:yankround_use_region_hl = 1

map p <Plug>(yankround-p)
map P <Plug>(yankround-P)
map gp <Plug>(yankround-gp)
map gP <Plug>(yankround-gP)

nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)


" EasyMotion
" --------------------
let g:EasyMotion_do_mapping = 0

let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_migemo = 1

let g:EasyMotion_startofline = 0
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1

let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTASDGZXCVBJF'

""" 2-key Find Motion
map s <Plug>(easymotion-bd-f2)
nmap s <Plug>(easymotion-overwin-f2)

""" 1-key Find Motion (Within Line)
map <Leader>s <Plug>(easymotion-bd-fl)

""" Custom Highlighting
" highlight link EasyMotionTarget ErrorMsg
" highlight link EasyMotionShade Comment
"
" highlight link EasyMotionTarget2First MatchParen
" highlight link EasyMotionTarget2Second MatchParen
"
" highlight link EasyMotionMoveHL Search
" highlight link EasyMotionIncSearch Search


" operator-replace
" --------------------
map R <Plug>(operator-replace)


" operator-surround
" --------------------
nnoremap S <Nop>

map Sa <Plug>(operator-surround-append)
map Sd <Plug>(operator-surround-delete)
map Sr <Plug>(operator-surround-replace)

let g:operator#surround#blocks = {
  \ '-' : [
  \   { 'block': [ '**', '**' ], 'motionwise': [ 'char', 'line', 'block' ], 'keys': [ '*' ] },
  \ ]}


" operator-flashy
" --------------------
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$


" Memolist
" --------------------
let g:memolist_path = "$HOME/Dropbox/memos"
let g:memolist_template_dir_path = "$HOME/dotfiles"
let g:memolist_memo_suffix = "md"
let g:memolist_memo_date = "%Y-%m-%d %H:%M"

nnoremap <Leader>mn :<C-u>MemoNew<CR>
nnoremap <Leader>ml :<C-u>MemoList<CR>
nnoremap <Leader>mg :<C-u>MemoGrep<CR>


" fzf.vim
" --------------------
let g:fzf_layout = { 'down': '~60%' }
let g:fzf_buffers_jump = 1

nnoremap <Leader>f <Nop>
nnoremap [fzf] <Nop>
nmap <Leader>f [fzf]

nnoremap [fzf]f :<C-u>Files<CR>
nnoremap [fzf]b :<C-u>Buffers<CR>
nnoremap [fzf]l :<C-u>BLines<CR>
nnoremap [fzf]h :<C-u>History<CR>
nnoremap [fzf]m :<C-u>Marks<CR>
nnoremap [fzf]r :<C-u>Rg<Space>

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg  --line-number --no-heading --color=auto --smart-case '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview('right:50%:wrap'))


" lexima
" --------------------
call lexima#add_rule({'char': '（', 'input': '（', 'input_after': '）'})
call lexima#add_rule({'char': '［', 'input': '［', 'input_after': '］'})
call lexima#add_rule({'char': '｛', 'input': '｛', 'input_after': '｝'})
call lexima#add_rule({'char': '「', 'input': '「', 'input_after': '」'})
call lexima#add_rule({'char': '『', 'input': '『', 'input_after': '』'})
call lexima#add_rule({'char': '〈', 'input': '〈', 'input_after': '〉'})
call lexima#add_rule({'char': '【', 'input': '【', 'input_after': '】'})
call lexima#add_rule({'char': '〔', 'input': '〔', 'input_after': '〕'})

call lexima#add_rule({'char': '）', 'at': '\%#）', 'leave': 1})
call lexima#add_rule({'char': '］', 'at': '\%#］', 'leave': 1})
call lexima#add_rule({'char': '｝', 'at': '\%#｝', 'leave': 1})
call lexima#add_rule({'char': '」', 'at': '\%#」', 'leave': 1})
call lexima#add_rule({'char': '』', 'at': '\%#』', 'leave': 1})
call lexima#add_rule({'char': '〉', 'at': '\%#〉', 'leave': 1})
call lexima#add_rule({'char': '】', 'at': '\%#】', 'leave': 1})
call lexima#add_rule({'char': '〕', 'at': '\%#〕', 'leave': 1})

call lexima#add_rule({'char': '<BS>', 'at': '（\%#）', 'input': '<BS>', 'delete' : 1})
call lexima#add_rule({'char': '<BS>', 'at': '［\%#］', 'input': '<BS>', 'delete' : 1})
call lexima#add_rule({'char': '<BS>', 'at': '｛\%#｝', 'input': '<BS>', 'delete' : 1})
call lexima#add_rule({'char': '<BS>', 'at': '「\%#」', 'input': '<BS>', 'delete' : 1})
call lexima#add_rule({'char': '<BS>', 'at': '『\%#』', 'input': '<BS>', 'delete' : 1})
call lexima#add_rule({'char': '<BS>', 'at': '〈\%#〉', 'input': '<BS>', 'delete' : 1})
call lexima#add_rule({'char': '<BS>', 'at': '【\%#】', 'input': '<BS>', 'delete' : 1})
call lexima#add_rule({'char': '<BS>', 'at': '〔\%#〕', 'input': '<BS>', 'delete' : 1})


" fugitive.vim
" --------------------


" gitv
" --------------------

