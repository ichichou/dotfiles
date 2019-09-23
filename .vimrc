" ========================================
" .vimrc
" ========================================
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8,euc-jp,sjis
" set fileencodings=iso-2022-jp,cp932,euc-jp,sjis,utf=8
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

set noswapfile
set nobackup
set nowritebackup

set helplang=ja,en

augroup vimrc
  autocmd FileType help,qf,man,ref nnoremap <silent> <buffer> q :q!<CR>
augroup END

" ----------------------------------------
" Appearance
" ----------------------------------------
set background=dark
" set termguicolors

set title
set number
set cursorline

set showmatch
set matchtime=1
set matchpairs+=（:）,［:］,｛:｝,「:」,『:』,〈:〉,【:】,〔:〕

source $VIMRUNTIME/macros/matchit.vim
let b:match_ignorecase = 1
" let b:match_words = "<if>:<endif>"

set showtabline=1
set laststatus=2
set noshowmode
set showcmd
set ruler

set display=lastline
set scrolloff=3
set breakindent
set nofoldenable
augroup vimrc
  autocmd FileType vim setlocal foldmethod=marker
augroup END

set belloff=all

set list
set listchars=eol:¬,tab:»\ ,space:\ ,trail:\ ,extends:>,precedes:<,nbsp:~
set ambiwidth=double

set splitbelow
set splitright

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

command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
  \ | wincmd p | diffthis

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

  set guifont=Myrica\ Monospace:h14
  " set guifontwide=
  set linespace=2
  set columns=140
  set lines=50
endif

if has('gui_macvim')
  let g:macvim_skip_colorscheme = 1
  let g:no_gvimrc_example = 1
endif

" ----------------------------------------
" Editting
" ----------------------------------------
set tabstop=2
set softtabstop=2
set shiftwidth=2

augroup vimrc
  autocmd FileType markdown setlocal tabstop=4 softtabstop=4 shiftwidth=4
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
" noremap / /\v

noremap Y y$
noremap x "_x
noremap X "_X

" noremap あ a
" noremap い i
" noremap う u
" noremap え e
" noremap お o

noremap j gj
noremap k gk
noremap gj j
noremap gk k

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" set termwinkey=<C-l>
" tnoremap <F1> <C-\><C-n>

nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>
nnoremap <silent> <Leader>r :<C-u>redraw!<CR>
nnoremap <silent> <Leader>t :<C-u>vertical terminal fish<CR>
nnoremap <silent> <Leader>. :<C-u>source ~/dotfiles/.vimrc<CR>
nnoremap <silent> <Leader><Leader> :<C-u>edit ~/dotfiles/.vimrc<CR>

noremap ZZ <Nop>
noremap ZQ <Nop>
noremap Q <Nop>
noremap gQ <Nop>

" Insert Blank Line
" --------------------
nnoremap <silent> go :<C-u>for i in range(1, v:count1) \|
  \ call append(line('.'), '') \| endfor \|
  \ silent! call repeat#set("go", v:count1)<CR>
nnoremap <silent> gO :<C-u>for i in range(1, v:count1) \|
  \ call append(line('.')-1, '') \| endfor \|
  \ silent! call repeat#set("gO", v:count1)<CR>

" Window/Tabpage
" --------------------
nnoremap t <Nop>
nnoremap [window] <Nop>
nmap t [window]

nnoremap [window]/ :<C-u>vertical help<Space>

nnoremap [window]= <C-w>=

nnoremap [window]h <C-w>h
nnoremap [window]j <C-w>j
nnoremap [window]k <C-w>k
nnoremap [window]l <C-w>l

nnoremap [window]H <C-w>H
nnoremap [window]J <C-w>J
nnoremap [window]K <C-w>K
nnoremap [window]L <C-w>L

nnoremap <silent> [window]t :<C-u>tabnew<CR>
nnoremap <silent> [window]q :<C-u>tabclose<CR>
nnoremap [window]n gt
nnoremap [window]p gT
nnoremap <silent> [window]N :<C-u>+tabmove<CR>
nnoremap <silent> [window]P :<C-u>-tabmove<CR>

" ----------------------------------------
" vim-plug
" ----------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  silent !mkdir -p ~/.vim/colors
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Editting
" --------------------
Plug 'tpope/vim-repeat'
" Plug 'kana/vim-repeat'
Plug 'LeafCage/yankround.vim'
Plug 'kana/vim-smartinput'
Plug 'cohama/vim-smartinput-endwise'
Plug 'tyru/caw.vim'
Plug 'godlygeek/tabular'
Plug 'glidenote/memolist.vim'
Plug 'qpkorr/vim-renamer'
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier', { 'for': [
  \ 'html', 'markdown', 'yaml', 'css', 'less', 'scss', 'javascript', 'json', ] }

" Movement
" --------------------
Plug 'cocopon/vaffle.vim'
Plug 'tyru/open-browser.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/is.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Language
" --------------------
Plug 'sheerun/vim-polyglot'
Plug 'joker1007/vim-markdown-quote-syntax', { 'for': 'markdown' }
Plug 'rcmdnk/vim-markdown', { 'for': 'markdown' }
" Plug 'dagwieers/asciidoc-vim', { 'for': 'asciidoc' }
Plug 'dense-analysis/ale'

" Operator / Text Object
" --------------------
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'rhysd/vim-operator-surround'
Plug 'haya14busa/vim-operator-flashy'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'

" Git
" --------------------
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'cohama/agit.vim', { 'on': 'Agit' }

" Japanese
" --------------------
Plug 'vim-jp/vimdoc-ja'
Plug 'haya14busa/vim-migemo'
Plug 'deton/jasegment.vim'
Plug 'deton/jasentence.vim'

" Appearance
" --------------------
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-highlighturl'
Plug 'cocopon/lightline-hybrid.vim'
Plug 'ntpeters/vim-better-whitespace'

" Colorscheme
" --------------------
Plug 'w0ng/vim-hybrid', { 'do': 'cp colors/* ~/.vim/colors/' }
Plug 'cocopon/iceberg.vim', { 'do': 'cp colors/* ~/.vim/colors/' }
Plug 'arcticicestudio/nord-vim', { 'do': 'cp colors/* ~/.vim/colors/' }
Plug 'jacoborus/tender.vim', { 'do': 'cp colors/* ~/.vim/colors/' }

call plug#end()

" ----------------------------------------
" Plugins
" ----------------------------------------

" colorschemes
" --------------------
if has('gui_running')
  colorscheme iceberg
else
  colorscheme hybrid
endif
" hybrid iceberg tender nord

let g:hybrid_custom_term_colors = 1
" let g:lightline_hybrid_style = 'plain'

let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_uniform_status_lines = 1
let g:nord_comment_brightness = 15
let g:nord_uniform_diff_background = 1
let g:nord_cursor_line_number_background = 1

" lightline
" --------------------
" powerline wombat jellybeans solarized PaperColor seoul256 Dracula one landscape
" hybrid iceberg tender tenderplus nord

if has('gui_running')
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
else
  let g:lightline = {
  \ 'colorscheme': 'hybrid',
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
endif

function! FilePath()
  if winwidth(0) > 70
    return expand('%:s')
  else
    return expand('%:t')
  endif
endfunction

let g:lightline.tabline = {
  \ 'left': [ [ 'tabs' ] ],
  \ 'right': [ [ '' ] ],
  \ }

" vaffle
" --------------------
let g:vaffle_auto_cd = 1
let g:vaffle_show_hidden_files = 1

nnoremap <silent> <Leader>v :<C-u>Vaffle<CR>

" rcmdnk/vim-markdown
" --------------------
highlight link htmlItalic LineNr
highlight link htmlBold WarningMsg
highlight link htmlBoldItalic ErrorMsg

let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_conceal = 0

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

" vim-easymotion
" --------------------
let g:EasyMotion_do_mapping = 0

let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_migemo = 1

let g:EasyMotion_startofline = 0
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1

let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTASDGZXCVBJF'

map s <Plug>(easymotion-bd-f2)
nmap s <Plug>(easymotion-overwin-f2)
" map f <Plug>(easymotion-bd-fl)
" map F <Plug>(easymotion-bd-fl)

" highlight link EasyMotionTarget ErrorMsg
" highlight link EasyMotionShade Comment
" highlight link EasyMotionTarget2First MatchParen
" highlight link EasyMotionTarget2Second MatchParen
" highlight link EasyMotionMoveHL Search
" highlight link EasyMotionIncSearch Search

" operator-replace
" --------------------
map R <Plug>(operator-replace)

" operator-surround
" --------------------
nnoremap S <Nop>
map S <Plug>(operator-surround-append)
map Sd <Plug>(operator-surround-delete)
map Sr <Plug>(operator-surround-replace)

let g:operator#surround#blocks = {
  \ '-' : [
  \   { 'block': [ '**', '**' ], 'motionwise': [ 'char', 'line', 'block' ], 'keys': [ '*' ] },
  \   { 'block': [ '（', '）' ], 'motionwise': [ 'char', 'line', 'block' ], 'keys': [ '（', '）', 'm' ] },
  \   { 'block': [ '「', '」' ], 'motionwise': [ 'char', 'line', 'block' ], 'keys': [ '「', '」', 'k' ] },
  \ ]}

" operator-flashy
" --------------------
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

" memolist
" --------------------
let g:memolist_path = "$HOME/Box/Memos"
let g:memolist_template_dir_path = "$HOME/dotfiles/memolist"
let g:memolist_memo_suffix = "md"
let g:memolist_memo_date = "%Y-%m-%d %H:%M"

nnoremap <silent> <Leader>mn :<C-u>MemoNew<CR>
nnoremap <silent> <Leader>ml :<C-u>MemoList<CR>
" nnoremap <silent> <Leader>mg :<C-u>MemoGrep<CR>
nnoremap <silent> <Leader>mg :execute "FZF" g:memolist_path<CR>

" fzf
" --------------------
let g:fzf_layout = { 'down': '~60%' }
let g:fzf_buffers_jump = 1

nnoremap <Leader>f <Nop>
nnoremap [fzf] <Nop>
nmap <Leader>f [fzf]

nnoremap <silent> [fzf]b :<C-u>Buffers<CR>
nnoremap <silent> [fzf]c :<C-u>Colors<CR>
nnoremap <silent> [fzf]f :<C-u>Files<CR>
nnoremap <silent> [fzf]h :<C-u>History<CR>
nnoremap <silent> [fzf]l :<C-u>BLines<CR>
nnoremap <silent> [fzf]m :<C-u>Marks<CR>
nnoremap <silent> [fzf]t :<C-u>Filetypes<CR>
nnoremap [fzf]r :<C-u>Rg<Space>

nnoremap <silent> <Leader>b :<C-u>Buffers<CR>

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --line-number --no-heading --color=auto --smart-case '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview('right:50%:wrap'))

" gitgutter
" --------------------
set updatetime=250

nnoremap <Leader>hs <Nop>
nnoremap <Leader>hu <Nop>

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

nnoremap <Leader>h <Nop>
nnoremap [gitgutter] <Nop>
nmap <Leader>h [gitgutter]

nnoremap <silent> [gitgutter]j :<C-u>GitGutterNextHunk<CR>
nnoremap <silent> [gitgutter]k :<C-u>GitGutterPrevHunk<CR>
nnoremap <silent> [gitgutter]h :<C-u>GitGutterLineHighlightsToggle<CR>
nnoremap <silent> [gitgutter]p :<C-u>GitGutterPreviewHunk<CR>

" fugitive
" --------------------
nnoremap <Leader>g <Nop>
nnoremap [fugitive] <Nop>
nmap <Leader>g [fugitive]

nnoremap <silent> [fugitive]s :<C-u>Gstatus<CR>
nnoremap <silent> [fugitive]a :<C-u>Gwrite<CR>
nnoremap <silent> [fugitive]c :<C-u>Gcommit -v<CR>
nnoremap <silent> [fugitive]d :<C-u>Gvdiffsplit<CR>
nnoremap <silent> [fugitive]l :<C-u>Glog<CR>

augroup vimrc
  autocmd FileType fugitive nnoremap <silent> <buffer> q <C-w>q
augroup END

" agit
" --------------------
" let g:agit_enable_auto_show_commit = 0
" let g:agit_enable_auto_refresh = 1

" caw.vim
" --------------------
map <Leader>c <Plug>(caw:hatpos:toggle)
map <Leader>0 <Plug>(caw:zeropos:toggle)

" vim-polyglot
" --------------------
let g:polyglot_disabled = ['markdown']

" tabular
" --------------------
map <Leader>a= :Tabularize /=<CR>
map <Leader>a: :Tabularize /:\zs<CR>

inoremap <silent> <Bar> <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' &&
  \ (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" vim-smartinput
" --------------------
call smartinput#define_rule({'at': '\%#', 'char': '（', 'input': '（）<Left>'})
call smartinput#define_rule({'at': '\%#', 'char': '「', 'input': '「」<Left>'})
call smartinput#define_rule({'at': '\%#', 'char': '『', 'input': '『』<Left>'})
call smartinput#define_rule({'at': '\%#', 'char': '〈', 'input': '〈〉<Left>'})
call smartinput#define_rule({'at': '\%#', 'char': '【', 'input': '【】<Left>'})
call smartinput#define_rule({'at': '\%#', 'char': '［', 'input': '［］<Left>'})
call smartinput#define_rule({'at': '\%#', 'char': '｛', 'input': '｛｝<Left>'})

" vim-closetag
" --------------------
let g:closetag_filetypes = 'html,xhtml,phtml,xml,markdown'

" vim-prettier
" --------------------
let g:prettier#exec_cmd_path = "/usr/local/bin/prettier"
let g:prettier#autoformat = 0
" let g:prettier#quickfix_enabled = 0
let g:prettier#quickfix_auto_focus = 0
" let g:prettier#exec_cmd_async = 1

" ale
" --------------------
let g:ale_lint_on_enter = 0
" let g:ale_lint_on_filetype_changed = 0
" let g:ale_lint_on_save = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1

" let g:ale_sign_column_always = 1
" let g:ale_sign_error = '!'
" g:ale_sign_warning = '?'

" let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_linters = {
  \ 'html': [ 'htmlhint' ],
  \ }

" let g:ale_fixers = {
"  \ 'html': [ '' ],
"  \ }

function! s:ale_list()
  let g:ale_open_list = 1
  call ale#Queue(0, 'lint_file')
endfunction
command! ALEList call s:ale_list()
nnoremap <silent> <Leader>l :ALEList<CR>

augroup vimrc
  autocmd FileType qf nnoremap <silent> <buffer> q :let g:ale_open_list = 0<CR>:q!<CR>
  autocmd FileType help,qf,man,ref let b:ale_enabled = 0
augroup END

nmap <Leader>a <Plug>(ale_toggle)
nmap ]a <Plug>(ale_next)
nmap [a <Plug>(ale_previous)

