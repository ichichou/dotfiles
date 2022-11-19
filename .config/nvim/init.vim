" ========================================
" Neovim
" ========================================

scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=utf-8,sjis,euc-jp,iso-2022-jp,cp932
set fileformats=unix,dos,mac

augroup vimrc
    autocmd!
augroup END

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

set noswapfile
set nowritebackup

set switchbuf=usetab,uselast

set shell=fish
set helplang=ja,en

set clipboard=unnamed,unnamedplus

set textwidth=0
set virtualedit=onemore
set whichwrap=b,s,h,l,<,>,[,]

set smartindent
set breakindent

set expandtab
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

set list
" set listchars=eol:¬,tab:»\ ,space:\ ,trail:\ ,extends:>,precedes:<,nbsp:~

set title
set number
set cursorline

set cmdheight=0
set laststatus=3
" set winbar=%f
set noshowmode
set signcolumn=yes

set scrolloff=5
set sidescrolloff=5

set nofoldenable
autocmd vimrc FileType vim setlocal foldmethod=marker

set updatetime=100

set splitbelow
" set splitright

set showmatch
set matchtime=1
set matchpairs&
set matchpairs+=（:）,「:」,『:』,〈:〉,《:》,【:】,〔:〕,［:］,｛:｝,‘:’,“:”


" Search/Completion
" ========================================

set ignorecase
set smartcase
set gdefault

set pumheight=10
set completeopt=menuone,noinsert
" set completeopt=menuone,noinsert,popup

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

noremap x "_x
noremap X "_X

noremap U <C-r>

noremap + <C-a>
noremap - <C-x>

noremap <C-h> <C-^>
" noremap <C-j> :<C-u>bprevious<CR>
" noremap <C-k> :<C-u>bnext<CR>

nnoremap <CR> i<CR><Esc>

cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" set termwinkey=<C-g>
" tnoremap <F1> <C-\><C-n>

nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>
nnoremap <silent> <Leader>t :<C-u>vertical terminal ++close<CR>

augroup vimrc
    autocmd FileType markdown inoremap <Tab> <C-t>
    autocmd FileType markdown inoremap <S-Tab> <C-d>
    autocmd FileType markdown inoremap <C-d> <Delete>
augroup END

augroup vimrc
    autocmd FileType markdown
    \ nnoremap <Leader>d o## <C-r>=strftime('%Y-%m-%d %H:%M:%S')<CR><CR>
    autocmd FileType markdown
    \ nnoremap <Leader>D o<CR>## <C-r>=strftime('%Y-%m-%d %H:%M:%S')<CR><CR>
augroup END

if has('gui_running')
    nnoremap <silent> <Leader><Leader> :<C-u>edit $MYVIMRC<CR>
    nnoremap <silent> <Leader><lt> :<C-u>edit $MYGVIMRC<CR>
    nnoremap <silent> <Leader>. :<C-u>source $MYVIMRC<CR> :<C-u>source $MYGVIMRC<CR>
else
    nnoremap <silent> <Leader><Leader> :<C-u>edit $MYVIMRC<CR>
    nnoremap <silent> <Leader>. :<C-u>source $MYVIMRC<CR>
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

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" --------------------
" Language Server
" --------------------

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

" --------------------
" Appearance
" --------------------

" --------------------
" Operator / Text Object
" --------------------

" --------------------
" Japanese Support
" --------------------

" --------------------
" Colorscheme
" --------------------
Plug 'arcticicestudio/nord-vim'

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

" --------------------
" Colorscheme
" --------------------
colorscheme nord

" --------------------
" Matchit
" --------------------
let b:match_ignorecase = 1

" --------------------
" Previm
" --------------------
let g:previm_open_cmd = 'open -a Google\ Chrome'
" let g:previm_disable_default_css = 1
" let g:previm_custom_css_path = ''
" let g:previm_show_header = 0

nnoremap <silent> <Leader>p :<C-u>PrevimOpen<CR>

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
