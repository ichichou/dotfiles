" jsesentence の設定。！や？など。
" Karabiner、[Grobal] Caps Lock -> Control-g の設定


" ========================================
" .vimrc
" ========================================
set encoding=utf-8
scriptencoding utf-8

" set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

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
" hybrid iceberg japanesque tender deep-space nord gruvbox onedark seoul256 tomorrow

set background=dark
" set termguicolors

set title
set number
set cursorline

set showmatch
set matchtime=1
set matchpairs+=（:）,［:］,｛:｝,「:」,『:』,〈:〉,【:】,〔:〕,‘:’,“:”

set showtabline=2
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
    set guifont=Myrica\ Monospace:h14
"    set guifontwide=

    set columns=160
    set lines=50
    set linespace=3

    set guioptions+=c
    set guioptions-=e
    set guioptions-=m
    set guioptions-=r
    set guioptions-=L
    set guioptions-=t
    set guioptions-=T

    set guicursor+=a:blinkon0
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
set expandtab
set smarttab

set shiftwidth=4
set shiftround
set autoindent
set smartindent

" set virtualedit=onemore
set textwidth=0
set backspace=indent,eol,start
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
set wildmode=list:longest,full
set history=10000

set completeopt=menu,menuone,preview
" set pumheight=10
set infercase


" ----------------------------------------
" Keymap
" ----------------------------------------

"        Normal  Insert  Command  Visual
"        ------  ------  -------  -------
"  map   x                        x
"  map!          x       x
"  nmap  x
"  imap          x
"  cmap                  x
"  vmap                           x


let g:mapleader = ','
noremap \ ,

noremap ; :
noremap : ;

noremap Y y$
" noremap x “_x
" noremap X “_X

noremap j gj
noremap k gk
noremap gj j
noremap gk k

nnoremap + <C-a>
nnoremap - <C-x>

nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>
nnoremap <silent> <Leader>r :<C-u>redraw!<CR>

noremap ZZ <Nop>
noremap ZQ <Nop>
noremap Q <Nop>


" SKK
" --------------------
inoremap <C-j> <Nop>
inoremap <C-l> <Nop>
inoremap <C-g> <Nop>


" 空行の挿入
" --------------------
nnoremap <silent> go :<C-u>for i in range(1, v:count1) \| call append(line('.'), '') \| endfor \| silent! call repeat#set("go", v:count1)<CR>
nnoremap <silent> gO :<C-u>for i in range(1, v:count1) \| call append(line('.')-1, '') \| endfor \| silent! call repeat#set("gO", v:count1)<CR>


" Window, Tab Page
" --------------------
nnoremap t <Nop>
nnoremap [window] <Nop>
nmap t [window]

""" 開く・閉じる
nnoremap [window]o :<C-u>edit<Space>
nnoremap [window]t :<C-u>tabedit<Space>
nnoremap <silent> [window]d :<C-u>tabclose<CR>

""" タブ移動
nnoremap <silent> [window]ml :<C-u>tabmove +1<CR>
nnoremap <silent> [window]mh :<C-u>tabmove -1<CR>
nnoremap <silent> [window]m0 :<C-u>tabmove 0<CR>
nnoremap <silent> [window]m$ :<C-u>tabmove<CR>

""" ウィンドウ分割
nnoremap [window]s :<C-u>split<CR>
nnoremap [window]v :<C-u>vsplit<CR>

""" ウィンドウ移動
nnoremap [window]h <C-w>h
nnoremap [window]j <C-w>j
nnoremap [window]k <C-w>k
nnoremap [window]l <C-w>l

nnoremap [window]H <C-w>H
nnoremap [window]J <C-w>J
nnoremap [window]K <C-w>K
nnoremap [window]L <C-w>L

""" ウィンドウサイズ
nnoremap [window]<Bar> <C-w><Bar>
nnoremap [window]_ <C-w>_
nnoremap [window]= <C-w>=

""" ドキュメント
nnoremap [window]/ :<C-u>vertical help<Space>
nnoremap [window]? :<C-u>tab help<Space>


" ----------------------------------------
" vim-plug
" ----------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
    call system('mkdir -p ~/.vim/colors')
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Generals
" --------------------
Plug 'junegunn/vim-plug', {'dir': '~/.vim/plugged/vim-plug/autoload'}
Plug 'vim-jp/vimdoc-ja'
Plug 'itchyny/lightline.vim'
Plug 'cocopon/vaffle.vim'
Plug 'cocopon/lightline-hybrid.vim'
Plug 'rcmdnk/vim-markdown'
Plug 'kannokanno/previm'
Plug 'joker1007/vim-markdown-quote-syntax'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-repeat'
Plug 'tyru/open-browser.vim'
Plug 'LeafCage/yankround.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/is.vim'
Plug 'haya14busa/vim-migemo'
Plug 'glidenote/memolist.vim'
Plug 'Shougo/denite.nvim'
Plug 'cohama/lexima.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'deton/jasentence.vim'

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
Plug 'w0ng/vim-hybrid', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'cocopon/iceberg.vim', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'aereal/vim-colors-japanesque', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'jacoborus/tender.vim', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'tyrannicaltoucan/vim-deep-space', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'arcticicestudio/nord-vim', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'morhetz/gruvbox', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'joshdick/onedark.vim', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'junegunn/seoul256.vim', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'chriskempson/vim-tomorrow-theme', {'do': 'cp colors/* ~/.vim/colors/'}

call plug#end()


" ----------------------------------------
" Plugins
" ----------------------------------------

" lightline
" --------------------
let g:lightline = {
    \ 'active': {
    \   'left': [ ['mode', 'paste'], ['readonly', 'filename', 'modified'] ]
    \ },
    \ 'component': {
    \   'lineinfo': '%3l/%L'
    \ },
    \ 'component_function': {
    \ },
    \ 'colorscheme': 'hybrid'
    \ }
" powerline wombat jellybeans solarized PaperColor seoul256 Dracula one landscape
" hybrid iceberg tender tenderplus deepspace nord gruvbox onedark


" vaffle
" --------------------
let g:vaffle_auto_cd = 1
let g:vaffle_show_hidden_files = 1

nnoremap <Leader>v :<C-u>Vaffle<CR>


" rcmdnk/vim-markdown
" --------------------
autocmd BufRead,BufNewFile *.{txt,text} set filetype=markdown

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_math = 1

hi link htmlItalic LineNr
hi link htmlBold WarningMsg
hi link htmlBoldItalic ErrorMsg


" previm
" --------------------
let g:previm_enable_realtime = 1
let g:previm_show_header = 0
let g:previm_disable_default_css = 0
" let g:previm_custom_css_path = ''

nnoremap <Leader>p :<C-u>PrevimOpen<CR>


" better-whitespace
" --------------------
highlight ExtraWhitespace ctermbg=DarkRed
highlight ExtraWhitespace guibg=DarkRed


" lexima
" --------------------
call lexima#add_rule({'char': '<', 'input_after': '>'})
call lexima#add_rule({'char': '（', 'input_after': '）'})
call lexima#add_rule({'char': '［', 'input_after': '］'})
call lexima#add_rule({'char': '｛', 'input_after': '｝'})
call lexima#add_rule({'char': '「', 'input_after': '」'})
call lexima#add_rule({'char': '『', 'input_after': '』'})
call lexima#add_rule({'char': '〈', 'input_after': '〉'})
call lexima#add_rule({'char': '【', 'input_after': '】'})
call lexima#add_rule({'char': '〔', 'input_after': '〕'})

call lexima#add_rule({'char': '<BS>', 'at': '(\%#)', 'input': '<BS>', 'delete': 1})
call lexima#add_rule({'char': '<BS>', 'at': '[\%#]', 'input': '<BS>', 'delete': 1})
call lexima#add_rule({'char': '<BS>', 'at': '{\%#}', 'input': '<BS>', 'delete': 1})
call lexima#add_rule({'char': '<BS>', 'at': '<\%#>', 'input': '<BS>', 'delete': 1})
" call lexima#add_rule({'char': '<BS>', 'at': '（\%#）', 'input': '<BS>', 'delete': 1})
" call lexima#add_rule({'char': '<BS>', 'at': '［\%#］', 'input': '<BS>', 'delete': 1})
" call lexima#add_rule({'char': '<BS>', 'at': '｛\%#｝', 'input': '<BS>', 'delete': 1})
" call lexima#add_rule({'char': '<BS>', 'at': '「\%#」', 'input': '<BS>', 'delete': 1})
" call lexima#add_rule({'char': '<BS>', 'at': '『\%#』', 'input': '<BS>', 'delete': 1})
" call lexima#add_rule({'char': '<BS>', 'at': '〈\%#〉', 'input': '<BS>', 'delete': 1})
" call lexima#add_rule({'char': '<BS>', 'at': '【\%#】', 'input': '<BS>', 'delete': 1})
" call lexima#add_rule({'char': '<BS>', 'at': '〔\%#〕', 'input': '<BS>', 'delete': 1})

call lexima#add_rule({'char': '>', 'at': '\%#>', 'leave': 1})
" call lexima#add_rule({'char': '）', 'at': '\%#）', 'leave': 1})
" call lexima#add_rule({'char': '］', 'at': '\%#］', 'leave': 1})
" call lexima#add_rule({'char': '｝', 'at': '\%#｝', 'leave': 1})
" call lexima#add_rule({'char': '」', 'at': '\%#」', 'leave': 1})
" call lexima#add_rule({'char': '』', 'at': '\%#』', 'leave': 1})
" call lexima#add_rule({'char': '〉', 'at': '\%#〉', 'leave': 1})
" call lexima#add_rule({'char': '】', 'at': '\%#】', 'leave': 1})
" call lexima#add_rule({'char': '〕', 'at': '\%#〕', 'leave': 1})


" open-browser
" --------------------
let g:netrw_nogx = 1

map gx <Plug>(openbrowser-smart-search)


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


" memolist
" --------------------
let g:memolist_path = "$HOME/Dropbox/memolist"
let g:memolist_template_dir_path = "$HOME/Dropbox/memolist"
let g:memolist_memo_suffix = "md"

" let g:memolist_denite = 1
" let g:memolist_denite_source = "anything"
" let g:memolist_denite_option = "anything"

nnoremap <Leader>m <Nop>
nnoremap [memolist] <Nop>
nmap <Leader>m [memolist]
nnoremap [memolist]n :<C-u>MemoNew<CR>
nnoremap [memolist]l :<C-u>MemoList<CR>
nnoremap [memolist]g :<C-u>MemoGrep<CR>


" easymotion
" --------------------
let g:EasyMotion_do_mapping = 0

let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_migemo = 1

let g:EasyMotion_startofline = 0
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1

let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTASDGZXCVBJF'

""" 1-key Find Motion
map <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

""" 2-key Find Motion
map s <Plug>(easymotion-bd-f2)
nmap s <Plug>(easymotion-overwin-f2)

""" JK Motion
map <Leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

""" Word Motion
map <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
map <Leader>W <Plug>(easymotion-bd-W)

""" Custom Highlighting
" hi link EasyMotionTarget ErrorMsg
" hi link EasyMotionShade Comment

" hi link EasyMotionTarget2First MatchParen
" hi link EasyMotionTarget2Second MatchParen

" hi link EasyMotionIncSearch Search
" hi link EasyMotionMoveHL Search


" operator-replace
" --------------------
map R <Plug>(operator-replace)


" operator-surround
" --------------------
map Sa <Plug>(operator-surround-append)
map Sd <Plug>(operator-surround-delete)
map Sr <Plug>(operator-surround-replace)

let g:operator#surround#blocks = {
    \ '-' : [
    \   { 'block': ['**', '**'], 'motionwise': ['char', 'line', 'block'], 'keys': ['*'] },
    \ ]
    \ }


" operator-flashy
" --------------------
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$


" denite
" --------------------
call denite#custom#option('default', 'prompt', '>')

""" Custon Map
call denite#custom#map('insert', "<C-j>", '<denite:move_to_next_line>')
call denite#custom#map('insert', "<C-k>", '<denite:move_to_previous_line>')

call denite#custom#map('normal', "v", '<denite:do_action:vsplit>')
call denite#custom#map('insert', "<C-t>", '<denite:do_action:tabopen>')
call denite#custom#map('insert', "<C-v>", '<denite:do_action:vsplit>')

""" Keymap
nnoremap <Space>u <Nop>
nnoremap [denite] <Nop>
nmap <Space>u [denite]

nnoremap <silent> [denite]o :<C-u>Denite file_rec<CR>
nnoremap <silent> [denite]c :<C-u>Denite colorscheme<CR>

