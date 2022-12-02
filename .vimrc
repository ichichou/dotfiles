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

augroup vimrc
    autocmd!
augroup END

unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

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
set switchbuf=usetab,uselast

set noswapfile
set nowritebackup

set shell=fish
set history=10000
set helplang=ja,en
set nrformats=bin,hex

set mouse=a
set ttymouse=xterm2
set clipboard=unnamed,unnamedplus

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

autocmd vimrc FileType gitcommit setlocal fileencoding=utf-8


" Appearance
" ========================================

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"

if has('vim_starting')
    let &t_SI .= "\e[6 q"
    let &t_EI .= "\e[2 q"
    let &t_SR .= "\e[4 q"
endif

set background=dark

set list
set listchars=eol:¬,tab:»\ ,space:\ ,trail:\ ,extends:>,precedes:<,nbsp:~

set title
set number
set cursorline

set laststatus=2
set noshowmode
set signcolumn=yes

set sidescroll=1
set sidescrolloff=5
set display=lastline

set nofoldenable
autocmd vimrc FileType vim setlocal foldmethod=marker

set ttyfast
set updatetime=100
set belloff=all

set splitbelow
" set splitright

set showmatch
set matchtime=1
set matchpairs&
set matchpairs+=（:）,「:」,『:』,〈:〉,《:》,【:】,〔:〕,［:］,｛:｝,‘:’,“:”


" Search/Completion
" ========================================

set hlsearch
set ignorecase
set smartcase
set gdefault

set wildoptions=pum,tagfile
set pumheight=10
set completeopt=menuone,noinsert
" set completeopt=menuone,noinsert,popup
set shortmess=filmnrxoOtTF

if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

augroup vimrc
    autocmd FileType help,qf,man,ref,diff nnoremap <silent> <buffer> q <Cmd>q!<CR>
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
" noremap <C-j> <Cmd>bprevious<CR>
" noremap <C-k> <Cmd>bnext<CR>

nnoremap <CR> i<CR><Esc>

cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" set termwinkey=<C-g>
" tnoremap <F1> <C-\><C-n>

nnoremap <silent> <Esc><Esc> <Cmd>nohlsearch<CR>
nnoremap <silent> <Leader>t <Cmd>vertical terminal ++close<CR>

augroup vimrc
    autocmd FileType markdown inoremap <Tab> <C-t>
    autocmd FileType markdown inoremap <S-Tab> <C-d>
    autocmd FileType markdown inoremap <C-d> <Delete>
    autocmd FileType markdown
    \ nnoremap <Leader>d o## <C-r>=strftime('%Y-%m-%d %H:%M:%S')<CR><CR>
    autocmd FileType markdown
    \ nnoremap <Leader>D o<CR>## <C-r>=strftime('%Y-%m-%d %H:%M:%S')<CR><CR>
augroup END

if has('gui_running')
    nnoremap <silent> <Leader><Leader> <Cmd>edit $MYVIMRC<CR>
    nnoremap <silent> <Leader><lt> <Cmd>edit $MYGVIMRC<CR>
    nnoremap <silent> <Leader>. <Cmd>source $MYVIMRC<CR> <Cmd>source $MYGVIMRC<CR>
else
    nnoremap <silent> <Leader><Leader> <Cmd>edit $MYVIMRC<CR>
    nnoremap <silent> <Leader>. <Cmd>source $MYVIMRC<CR>
endif

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
nnoremap <silent> go <Cmd>for i in range(1, v:count1) \|
\ call append(line('.'), '') \| endfor \|
\ silent! call repeat#set('go', v:count1)<CR>

nnoremap <silent> gO <Cmd>for i in range(1, v:count1) \|
\ call append(line('.')-1, '') \| endfor \|
\ silent! call repeat#set('gO', v:count1)<CR>

" --------------------
" Window/Tabpage
" --------------------
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

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !mkdir -p ~/.vim/colors
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" --------------------
" Language Server
" --------------------
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
" Plug 'Shougo/ddc.vim'
" Plug 'vim-denops/denops.vim'
" Plug 'shun/ddc-vim-lsp'

" --------------------
" Vim-polyglot
" --------------------
let g:polyglot_disabled = ['markdown.plugin', 'csv.plugin', 'r-lang.plugin']
" let g:polyglot_disabled += ['autoindent']
" let g:polyglot_disabled += ['sensible']

Plug 'sheerun/vim-polyglot'

" --------------------
" Language
" --------------------
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'mechatroner/rainbow_csv', {'for': 'csv'}
Plug 'vim-jp/syntax-vim-ex', {'for': 'vim'}
Plug 'prettier/vim-prettier', {'for': ['html', 'markdown', 'yaml', 'css', 'less', 'scss', 'javascript', 'json']}

Plug 'joker1007/vim-markdown-quote-syntax', {'for': 'markdown'}
Plug 'rcmdnk/vim-markdown', {'for': 'markdown'}
Plug 'previm/previm', {'for': 'markdown'}

" --------------------
" Edditing
" --------------------
Plug 'LeafCage/yankround.vim'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'cocopon/vaffle.vim'
Plug 'cohama/vim-smartinput-endwise'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'haya14busa/vim-asterisk'
Plug 'kana/vim-smartinput'
Plug 'mattn/vim-maketable'
Plug 'tpope/vim-repeat'
Plug 'tyru/caw.vim'
Plug 'tyru/open-browser.vim'
" Plug 'kana/vim-repeat'

set runtimepath+=/opt/homebrew/opt/fzf
Plug 'junegunn/fzf.vim'

" --------------------
" Appearance
" --------------------
Plug 'cocopon/lightline-hybrid.vim'
Plug 'haya14busa/is.vim'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-highlighturl'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rbtnn/vim-ambiwidth'

" --------------------
" Operator / Text Object
" --------------------
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'
Plug 'kana/vim-operator-replace'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'rhysd/vim-operator-surround'

" --------------------
" Japanese Support
" --------------------
Plug 'brglng/vim-im-select'
Plug 'deton/jasegment.vim'
Plug 'deton/jasentence.vim'
Plug 'haya14busa/vim-migemo'
Plug 'vim-jp/vimdoc-ja'

" --------------------
" Colorscheme
" --------------------
Plug 'arcticicestudio/nord-vim', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'cocopon/iceberg.vim', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'jacoborus/tender.vim', {'do': 'cp colors/* ~/.vim/colors/'}
Plug 'w0ng/vim-hybrid', {'do': 'cp colors/* ~/.vim/colors/'}

call plug#end()


" Plugin Settings
" ========================================

" --------------------
" Colorscheme Config
" --------------------

" Nord
" ----------
" let g:nord_cursor_line_number_background = 1
" let g:nord_uniform_status_lines = 1
" let g:nord_bold_vertical_split_line = 1
" let g:nord_uniform_diff_background = 1

" let g:nord_bold = 0
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

" Hybrid
" ----------
let g:hybrid_custom_term_colors = 1
" let g:lightline_hybrid_style = 'plain'

" --------------------
" Colorscheme
" --------------------
" nord iceberg tender hybrid
colorscheme nord

" --------------------
" Vim-lsp
" --------------------
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-rename)
    inoremap <expr> <CR> pumvisible() ? '<C-y>' : '<CR>'
    " inoremap <expr> <C-n> pumvisible() ? '<Down>' : '<C-n>'
    " inoremap <expr> <C-p> pumvisible() ? '<Up>' : '<C-p>'
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 200
" let g:lsp_text_edit_enabled = 0

" --------------------
" Matchit
" --------------------
packadd! matchit
let b:match_ignorecase = 1

" --------------------
" Caw
" --------------------
map <Leader>c <Plug>(caw:hatpos:toggle)
map <Leader>0 <Plug>(caw:zeropos:toggle)

" --------------------
" Fzf
" --------------------
let g:fzf_layout = {'down': '~60%'}
let g:fzf_buffers_jump = 1

command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang Colors
\ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\ 'rg --line-number --no-heading --color=auto --smart-case '.shellescape(<q-args>), 0,
\ fzf#vim#with_preview('right:50%:wrap'))

nnoremap <Leader>f <Nop>
nnoremap [fzf] <Nop>
nmap <Leader>f [fzf]

nnoremap <silent> [fzf]b <Cmd>Buffers<CR>
nnoremap <silent> [fzf]c <Cmd>Colors<CR>
nnoremap <silent> [fzf]f <Cmd>Files<CR>
nnoremap <silent> [fzf]h <Cmd>History<CR>
nnoremap <silent> [fzf]l <Cmd>BLines<CR>
nnoremap <silent> [fzf]m <Cmd>Marks<CR>
nnoremap <silent> [fzf]t <Cmd>Filetypes<CR>
nnoremap [fzf]r <Cmd>Rg<Space>

nnoremap <silent> <Leader>b <Cmd>Buffers<CR>

" --------------------
" Lightline
" --------------------
" powerline wombat jellybeans solarized PaperColor seoul256 Dracula one landscape
" hybrid iceberg tender tenderplus nord

let g:lightline = {
    \ 'colorscheme': 'nord',
    \ 'active': {
        \ 'left': [
            \ ['mode', 'paste'],
            \ ['readonly', 'filename', 'modified']
        \ ],
        \ 'right': [
            \ ['lineinfo'],
            \ ['percent'],
            \ ['fileformat', 'fileencoding', 'filetype']
        \ ]
    \ },
    \ 'component_function': {
        \ 'mode': 'LightlineMode',
        \ 'filepath': 'LightlineFilePath'
    \ }
\ }

let g:lightline.tabline = {
    \ 'left': [['tabs']],
    \ 'right': [['']],
\ }

function! LightlineMode()
    if winwidth(0) > 70
        return g:lightline#mode()
    else
        return g:lightline#mode()[0]
    endif
endfunction

function! LightlineFilePath()
    if winwidth(0) > 70
        return expand('%:p')
    else
        return expand('%:t')
    endif
endfunction

" --------------------
" Open Browser
" --------------------
let g:netrw_nogx = 1

map gx <Plug>(openbrowser-smart-search)

" --------------------
" Tabular
" --------------------
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

inoremap <silent> <Bar> <Bar><Esc><Cmd>call <SID>align()<CR>a

" map <Leader>a= <Cmd>Tabularize /=<CR>
" map <Leader>a: <Cmd>Tabularize /:\zs<CR>

" --------------------
" Vaffle
" --------------------
let g:vaffle_auto_cd = 1
let g:vaffle_show_hidden_files = 1

nnoremap <silent> <Leader>v <Cmd>Vaffle<CR>

" --------------------
" Asterisk
" --------------------
" let g:asterisk#keeppos = 1

map * <Plug>(asterisk-z*)
map # <Plug>(asterisk-z#)
map g* <Plug>(asterisk-gz*)
map g# <Plug>(asterisk-gz#)

" --------------------
" Better Whitespace
" --------------------
let g:better_whitespace_ctermcolor = 'DarkRed'
let g:better_whitespace_guicolor = 'DarkRed'

let g:better_whitespace_filetypes_blacklist = ['diff', 'git', 'gitcommit', 'qf', 'help']

" --------------------
" Closetag
" --------------------
let g:closetag_filetypes = 'html,xhtml,phtml,xml,markdown'

" --------------------
" Easymotion
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

" --------------------
" Gitgutter
" --------------------
let g:gitgutter_map_keys = 0

nnoremap <Leader>h <Nop>
nnoremap [gitgutter] <Nop>
nmap <Leader>h [gitgutter]

nnoremap <silent> [gitgutter]j <Cmd>GitGutterNextHunk<CR>
nnoremap <silent> [gitgutter]k <Cmd>GitGutterPrevHunk<CR>
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

nnoremap <silent> [gitgutter]p <Cmd>GitGutterPreviewHunk<CR>
nnoremap <silent> [gitgutter]t <Cmd>GitGutterLineHighlightsToggle<CR>
nnoremap <silent> [gitgutter]s <Cmd>GitGutterStagewHunk<CR>
nnoremap <silent> [gitgutter]u <Cmd>GitGutterUndoHunk<CR>

" --------------------
" Smartinput
" --------------------
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
call smartinput#map_to_trigger('i', '<', '<', '<')
call smartinput#map_to_trigger('i', '>', '>', '>')
" call smartinput#map_to_trigger('i', '（', '（', '（')
" call smartinput#map_to_trigger('i', '「', '「', '「')
" call smartinput#map_to_trigger('i', '『', '『', '『')
" call smartinput#map_to_trigger('i', '〈', '〈', '〈')
" call smartinput#map_to_trigger('i', '【', '【', '【')
" call smartinput#map_to_trigger('i', '）', '）', '）')
" call smartinput#map_to_trigger('i', '」', '」', '」')
" call smartinput#map_to_trigger('i', '』', '』', '』')
" call smartinput#map_to_trigger('i', '〉', '〉', '〉')
" call smartinput#map_to_trigger('i', '】', '】', '】')

call smartinput#define_rule({
    \ 'at': '\s\+\%#',
    \ 'char': '<CR>',
    \ 'input': '<C-o>:call setline(".", substitute(getline("."), "\\s\\+$", "", ""))<CR><CR>'})

" call smartinput#define_rule({'at': '\%#', 'char': '<', 'input': '<><Left>'})
" call smartinput#define_rule({'at': '\%#.*>', 'char': '<', 'input': '<'})
" call smartinput#define_rule({'at': '\%#.*<.*>', 'char': '<', 'input': '<><Left>'})
" call smartinput#define_rule({'at': '<.*\%#>', 'char': '>', 'input': '<Right>'})
" call smartinput#define_rule({'at': '<\%#>', 'char': '<BS>', 'input': '<BS><Del>'})
" call smartinput#define_rule({'at': '<>\%#', 'char': '<BS>', 'input': '<BS><BS>'})

call smartinput#define_rule({'at': '(\%#)', 'char': '<Space>', 'input': '<Space><Space><Left>'})
call smartinput#define_rule({'at': '{\%#}', 'char': '<Space>', 'input': '<Space><Space><Left>'})
call smartinput#define_rule({'at': '\[\%#\]', 'char': '<Space>', 'input': '<Space><Space><Left>'})
call smartinput#define_rule({'at': '<\%#>', 'char': '<Space>', 'input': '<Space><Space><Left>'})

call smartinput#define_rule({'at': '( \%# )', 'char': '<BS>', 'input': '<BS><Del>'})
call smartinput#define_rule({'at': '{ \%# }', 'char': '<BS>', 'input': '<BS><Del>'})
call smartinput#define_rule({'at': '\[ \%# \]', 'char': '<BS>', 'input': '<BS><Del>'})
call smartinput#define_rule({'at': '< \%# >', 'char': '<BS>', 'input': '<BS><Del>'})

" call smartinput#define_rule({'at': '\%#', 'char': '（', 'input': '（）<Left>'})
" call smartinput#define_rule({'at': '\%#', 'char': '「', 'input': '「」<Left>'})
" call smartinput#define_rule({'at': '\%#', 'char': '『', 'input': '『』<Left>'})
" call smartinput#define_rule({'at': '\%#', 'char': '〈', 'input': '〈〉<Left>'})
" call smartinput#define_rule({'at': '\%#', 'char': '【', 'input': '【】<Left>'})

" call smartinput#define_rule({'at': '\%#.*）', 'char': '（', 'input': '（'})
" call smartinput#define_rule({'at': '\%#.*」', 'char': '「', 'input': '「'})
" call smartinput#define_rule({'at': '\%#.*』', 'char': '『', 'input': '『'})
" call smartinput#define_rule({'at': '\%#.*〉', 'char': '〈', 'input': '〈'})
" call smartinput#define_rule({'at': '\%#.*】', 'char': '【', 'input': '【'})

" call smartinput#define_rule({'at': '\%#.*（.*）', 'char': '（', 'input': '（）<Left>'})
" call smartinput#define_rule({'at': '\%#.*「.*」', 'char': '「', 'input': '「」<Left>'})
" call smartinput#define_rule({'at': '\%#.*『.*』', 'char': '『', 'input': '『』<Left>'})
" call smartinput#define_rule({'at': '\%#.*〈.*〉', 'char': '〈', 'input': '〈〉<Left>'})
" call smartinput#define_rule({'at': '\%#.*【.*】', 'char': '【', 'input': '【】<Left>'})

call smartinput#define_rule({'at': '（.*\%#）', 'char': '）', 'input': '<Right>'})
call smartinput#define_rule({'at': '「.*\%#」', 'char': '」', 'input': '<Right>'})
call smartinput#define_rule({'at': '『.*\%#』', 'char': '』', 'input': '<Right>'})
call smartinput#define_rule({'at': '〈.*\%#〉', 'char': '〉', 'input': '<Right>'})
call smartinput#define_rule({'at': '【.*\%#】', 'char': '】', 'input': '<Right>'})

call smartinput#define_rule({'at': '（\%#）', 'char': '<BS>', 'input': '<BS><Del>'})
call smartinput#define_rule({'at': '「\%#」', 'char': '<BS>', 'input': '<BS><Del>'})
call smartinput#define_rule({'at': '『\%#』', 'char': '<BS>', 'input': '<BS><Del>'})
call smartinput#define_rule({'at': '〈\%#〉', 'char': '<BS>', 'input': '<BS><Del>'})
call smartinput#define_rule({'at': '【\%#】', 'char': '<BS>', 'input': '<BS><Del>'})

call smartinput#define_rule({'at': '（）\%#', 'char': '<BS>', 'input': '<BS><BS>'})
call smartinput#define_rule({'at': '「」\%#', 'char': '<BS>', 'input': '<BS><BS>'})
call smartinput#define_rule({'at': '『』\%#', 'char': '<BS>', 'input': '<BS><BS>'})
call smartinput#define_rule({'at': '〈〉\%#', 'char': '<BS>', 'input': '<BS><BS>'})
call smartinput#define_rule({'at': '【】\%#', 'char': '<BS>', 'input': '<BS><BS>'})

" --------------------
" Yankround
" --------------------
let g:yankround_max_history = 100
let g:yankround_use_region_hl = 1

map p <Plug>(yankround-p)
map P <Plug>(yankround-P)
map gp <Plug>(yankround-gp)
map gP <Plug>(yankround-gP)

nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

" --------------------
" Operator Flashy
" --------------------
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

" --------------------
" Operator Replace
" --------------------
map R <Plug>(operator-replace)

" --------------------
" Operator Surround
" --------------------
nnoremap S <Nop>
map S <Plug>(operator-surround-append)
map Sd <Plug>(operator-surround-delete)
map Sr <Plug>(operator-surround-replace)

let g:operator#surround#blocks = {'-' : [
    \ {
        \ 'block': ['**', '**'],
        \ 'motionwise': ['char', 'line', 'block'],
        \ 'keys': ['*']
    \ },
    \ {
        \ 'block': ['（', '）'],
        \ 'motionwise': ['char', 'line', 'block'],
        \ 'keys': ['p']
    \ },
    \ {
        \ 'block': ['「', '」'],
        \ 'motionwise': ['char', 'line', 'block'],
        \ 'keys': ['b']
    \ },
    \ {
        \ 'block': ['『', '』'],
        \ 'motionwise': ['char', 'line', 'block'],
        \ 'keys': ['d']
    \ },
\ ]}

" --------------------
" Textobj User
" --------------------
call textobj#user#plugin('jbrackets', {
    \ 'parens': {
        \ 'pattern': ['（', '）'],
        \ 'select-a': 'aP',
        \ 'select-i': 'iP'
    \ },
    \ 'braces': {
        \ 'pattern': ['「', '」'],
        \ 'select-a': 'aB',
        \ 'select-i': 'iB'
    \ },
    \ 'doublebraces': {
        \ 'pattern': ['『', '』'],
        \ 'select-a': 'aD',
        \ 'select-i': 'iD'
    \ }
\ })

" --------------------
" Previm
" --------------------
let g:previm_open_cmd = 'open -a Google\ Chrome'
" let g:previm_disable_default_css = 1
" let g:previm_custom_css_path = ''
" let g:previm_show_header = 0

nnoremap <silent> <Leader>p <Cmd>PrevimOpen<CR>

" --------------------
" Markdown
" --------------------
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

" highlight link htmlItalic LineNr
" highlight link htmlBold WarningMsg
" highlight link htmlBoldItalic ErrorMsg

" --------------------
" Prettier
" --------------------
let g:prettier#exec_cmd_path = '/opt/homebrew/bin/prettier'
let g:prettier#autoformat = 0
" let g:prettier#quickfix_enabled = 0
let g:prettier#quickfix_auto_focus = 0
" let g:prettier#exec_cmd_async = 1

" --------------------
" Vim-IM-Select
" --------------------
" let g:im_select_get_im_cmd = ['im-select']
let g:im_select_get_im_cmd = ['macism']
let g:ImSelectSetImCmd = {key -> ['macism', key]}
let g:im_select_default = 'jp.sourceforge.inputmethod.aquaskk.Ascii'
" let g:im_select_enable_for_gvim = 1

" --------------------
" Jasegment
" --------------------
call jasegment#define('nonblank', {
    \ 'move-n': 'gW',
    \ 'move-p': 'gB',
    \ 'move-N': 'gE',
    \ 'select-i': 'iE',
    \ 'select-a': 'aE',
\ })

" --------------------
" Jasentence
" --------------------
let g:jasentence_endpat = '[、。，．？！…（）「」『』〈〉《》【】〔〕［］｛｝‘’“”]\+'
