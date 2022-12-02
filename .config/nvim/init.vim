" ========================================
" Neovim
" ========================================

scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=utf-8,sjis,euc-jp,iso-2022-jp,cp932
set fileformats=unix,dos,mac

language messages en_US.UTF-8

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

set switchbuf=usetab,uselast

set noswapfile
set nowritebackup

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
Plug 'haya14busa/is.vim'
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

nnoremap <silent> [fzf]b :<C-u>Buffers<CR>
nnoremap <silent> [fzf]c :<C-u>Colors<CR>
nnoremap <silent> [fzf]f :<C-u>Files<CR>
nnoremap <silent> [fzf]h :<C-u>History<CR>
nnoremap <silent> [fzf]l :<C-u>BLines<CR>
nnoremap <silent> [fzf]m :<C-u>Marks<CR>
nnoremap <silent> [fzf]t :<C-u>Filetypes<CR>
nnoremap [fzf]r :<C-u>Rg<Space>

nnoremap <silent> <Leader>b :<C-u>Buffers<CR>

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

inoremap <silent> <Bar> <Bar><Esc>:call <SID>align()<CR>a

" map <Leader>a= :Tabularize /=<CR>
" map <Leader>a: :Tabularize /:\zs<CR>

" --------------------
" Vaffle
" --------------------
let g:vaffle_auto_cd = 1
let g:vaffle_show_hidden_files = 1

nnoremap <silent> <Leader>v :<C-u>Vaffle<CR>

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

nnoremap <silent> [gitgutter]j :<C-u>GitGutterNextHunk<CR>
nnoremap <silent> [gitgutter]k :<C-u>GitGutterPrevHunk<CR>
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

nnoremap <silent> [gitgutter]p :<C-u>GitGutterPreviewHunk<CR>
nnoremap <silent> [gitgutter]t :<C-u>GitGutterLineHighlightsToggle<CR>
nnoremap <silent> [gitgutter]s :<C-u>GitGutterStagewHunk<CR>
nnoremap <silent> [gitgutter]u :<C-u>GitGutterUndoHunk<CR>

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
