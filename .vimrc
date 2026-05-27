"
" .vimrc
"

" SETUP {{{

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

let g:no_vimrc_example  = 1
let g:no_gvimrc_example = 1

if has('gui_macvim')
  let g:macvim_skip_colorscheme      = 1
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

" }}}

" OPTIONS {{{

" Edit {{{

set hidden
set autoread
set switchbuf=usetab,uselast

set noswapfile
set nowritebackup

set shell=fish
set history=10000
set helplang=ja
set spelllang+=cjk
set nrformats=bin,hex
set clipboard=unnamed,unnamedplus

set textwidth=0
set virtualedit=onemore
set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
" set nostartofline
set autochdir

set autoindent
set smartindent
set breakindent

set expandtab
set smarttab
set shiftround
set tabstop=2
set shiftwidth=0
set softtabstop=-1

augroup vimrc
  autocmd FileType julia  setlocal tabstop=4
  autocmd FileType python setlocal tabstop=4
  autocmd FileType rust   setlocal tabstop=4
  autocmd FileType go     setlocal tabstop=4 noexpandtab
  autocmd BufRead,BufNewFile *.tsv setlocal tabstop=8 noexpandtab
augroup END

set formatoptions+=jro
set formatoptions-=c

augroup vimrc
  " autocmd FileType markdown setlocal formatoptions+=jro formatoptions-=c
  " autocmd FileType typst    setlocal formatoptions+=jro formatoptions-=c
  " autocmd FileType r        setlocal formatoptions+=jro formatoptions-=c
  autocmd FileType markdown setlocal comments=b:-,b:+,b:*,b:1.,nb:>
  autocmd FileType typst    setlocal comments=b:-,b:+
  autocmd FileType r        setlocal comments=b:#
augroup END

set foldmethod=marker
" set nofoldenable

set diffopt=internal,filler,closeoff,vertical,indent-heuristic,algorithm:histogram

" }}}

" View {{{

set title
set number
set signcolumn=yes
set list
set listchars=tab:≫\ ,trail:\ ,nbsp:~,extends:▶,precedes:◀

set display=lastline
set sidescroll=1
set scrolloff=0
set sidescrolloff=1

set updatetime=100
set belloff=all
set cursorline

set noshowmatch
set matchtime=0
set matchpairs+=（:）,「:」,『:』,〈:〉,《:》,【:】,〔:〕,［:］,｛:｝,‘:’,“:”

set noshowmode
set shortmess+=cmrF
set shortmess-=S

set statusline=%!SetStatusLine()

if has('nvim')
  set cmdheight=0
  set laststatus=3
else
  set laststatus=2
  set fillchars=vert:│,fold:·,foldsep:│,eob:·
endif

set termguicolors

if !has('nvim')
  " True Color
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  " Undercurl
  let &t_Cs = "\e[4:3m"
  let &t_Ce = "\e[4:0m"

  if has('vim_starting')
    " Corsor Style
    let &t_SI .= "\e[6 q"
    let &t_SR .= "\e[4 q"
    let &t_EI .= "\e[2 q"
  endif
endif

" }}}

" Search & Replace {{{

set hlsearch
set ignorecase
set smartcase
set gdefault

if executable('rg')
  let &grepprg = 'rg --vimgrep --smart-case'
  set grepformat=%f:%l:%c:%m
endif

" }}}

" Completion {{{

" -- Insert Mode
set complete+=o
set completeopt=menuone,noinsert
set autocomplete
set autocompletedelay=300
set pumopt=height:20

" -- Cmdline Mode
set wildmode=noselect:lastused,full
set wildoptions=pum,fuzzy

" }}}

" }}}

" KEYMAPS {{{

" :map Commands {{{

"        Norm   Ins   Cmd   Vis   Sel   Opr   Term   Lang
"       ------ ----- ----- ----- ----- ----- ------ ------
" map    yes     -     -    yes   yes   yes    -      -
" map!    -     yes   yes    -     -     -     -      -
" nmap   yes     -     -     -     -     -     -      -
" imap    -     yes    -     -     -     -     -      -
" cmap    -      -    yes    -     -     -     -      -
" vmap    -      -     -    yes   yes    -     -      -
" xmap    -      -     -    yes    -     -     -      -
" smap    -      -     -     -    yes    -     -      -
" omap    -      -     -     -     -    yes    -      -
" tmap    -      -     -     -     -     -    yes     -
" lmap    -     yes   yes    -     -     -     -     yes

" }}}

" General {{{

let g:mapleader = ','
let g:maplocalleader = '\'

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
nnoremap <BS>  <C-^>

nnoremap <C-;> <Cmd>nohlsearch <Bar> redraw!<CR>

inoremap <C-a> <Cmd>normal! ^<CR>
inoremap <C-e> <Cmd>normal! $l<CR>

cnoremap <C-a> <C-b>
cnoremap <C-x> <C-r>=expand('%:p')<CR>

" }}}

" Completion {{{

inoremap <expr> <CR>    pumvisible() ? '<C-y>' : '<CR>'
inoremap <expr> <TAB>   pumvisible() ? '<C-n>' : '<C-t>'
inoremap <expr> <S-TAB> pumvisible() ? '<C-p>' : '<C-d>'

cnoremap <expr> <Up>   wildmenumode() ? '<C-e><Up>'   : '<Up>'
cnoremap <expr> <Down> wildmenumode() ? '<C-e><Down>' : '<Down>'

if has('nvim')
  cnoremap <expr> <Up>   pumvisible() ? '<C-p>' : '<Up>'
  cnoremap <expr> <Down> pumvisible() ? '<C-n>' : '<Down>'
endif

" }}}

" Window {{{

nmap t <C-w>
nnoremap <C-w>t <C-w>w
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

" }}}

" .vimrc {{{

nnoremap <Leader>, <Cmd>edit $MYVIMRC<CR>
nnoremap <Leader>/ <Cmd>edit $HOME/dotfiles/vim/config<CR>

if has('gui_running')
  nnoremap <Leader><lt> <Cmd>edit $MYGVIMRC<CR>
  nnoremap <Leader>.
        \ <Cmd>source $MYVIMRC <Bar> source $MYGVIMRC <Bar>
        \ nohlsearch <Bar> redraw!<CR>
else
  nnoremap <Leader>.
        \ <Cmd>source $MYVIMRC <Bar>
        \ nohlsearch <Bar> redraw!<CR>
endif

" }}}

" Markdown {{{

augroup vimrc
  autocmd FileType markdown inoremap <buffer> <Tab>   <C-t>
  autocmd FileType markdown inoremap <buffer> <S-Tab> <C-d>
  autocmd FileType markdown inoremap <buffer> <C-d>   <Delete>
augroup END

" }}}

" zz -> zz, zt, zb... {{{

nmap zz zz<sid>(z1)
nnoremap <script> <sid>(z1)z zt<sid>(z2)
nnoremap <script> <sid>(z2)z zb<sid>(z3)
nnoremap <script> <sid>(z3)z zz<sid>(z1)

" }}}

" f -> z {{{

nmap f z
xmap f z

nmap zf zz
nnoremap <script> <sid>(z1)f zt<sid>(z2)
nnoremap <script> <sid>(z2)f zb<sid>(z3)
nnoremap <script> <sid>(z3)f zz<sid>(z1)

" }}}

" <Space> Leader {{{

" noremap <Space>l <Cmd>nohlsearch <Bar> redraw!<CR>
" noremap <expr> <Space>s <SID>substitute_last_search()

" nnoremap <Space>w <Cmd>update<CR>
" nnoremap <Space>q <Cmd>quit<CR>

" }}}

" Nop {{{

noremap ZZ    <Nop>
noremap ZQ    <Nop>
noremap Q     <Nop>
noremap gQ    <Nop>
noremap <Del> <Nop>

noremap  <C-j> <Nop>
noremap  <C-l> <Nop>
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

map <LeftMouse>   <Nop>
map <RightMouse>  <Nop>
map <MiddleMouse> <Nop>
map <2-LeftMouse> <Nop>
map <3-LeftMouse> <Nop>
map <4-LeftMouse> <Nop>

imap <LeftMouse>   <Nop>
imap <RightMouse>  <Nop>
imap <MiddleMouse> <Nop>
imap <2-LeftMouse> <Nop>
imap <3-LeftMouse> <Nop>
imap <4-LeftMouse> <Nop>

" }}}

" }}}

" AUTO COMMANDS {{{

" Filetype {{{

augroup vimrc
  autocmd FileType gitcommit setlocal fileencoding=utf-8
  autocmd BufRead,BufNewFile *.{txt,text} setlocal filetype=markdown
  autocmd BufRead,BufNewFile *.typ setlocal filetype=typst
  autocmd BufRead,BufNewFile *.keymap setlocal filetype=dts tabstop=4
augroup END

" }}}

" Quit by q {{{

augroup vimrc
  autocmd FileType help,qf,man,ref,diff,quickrun nnoremap <buffer> q <Cmd>quit!<CR>
  autocmd QuickFixCmdPost *grep*,make if len(getqflist()) != 0 | cwindow | endif
augroup END

" }}}

" Diff Mode {{{

autocmd vimrc VimEnter,DiffUpdated * call s:set_diff_mode()

function! s:set_diff_mode() abort
  if &diff
    setlocal nospell
    setlocal wrap<
  endif
endfunction

" }}}

" Highlight on Yank {{{

if has('nvim')
  autocmd vimrc TextYankPost * silent! lua
        \ vim.highlight.on_yank { higroup='Visual', timeout=200, on_visual=false }
endif

" }}}

" Auto IME On/Off {{{

" IME の切り替えには macism を使う
" osascript 経由で AppleScript/JavaScript を使うと macism より遅くなる

let s:ime_cmd  = 'macism'
let s:en_ime   = 'net.mtgto.inputmethod.macSKK.ascii'
let s:ja_ime   = 'net.mtgto.inputmethod.macSKK.hiragana'
let s:prev_ime = s:en_ime

" -- Auto IME Off
augroup vimrc
  autocmd VimEnter,VimResume,FocusGained * call s:ime_off()
  autocmd InsertLeave * call s:ime_off()
augroup END

" -- Auto IME On/Off
" Insert mode を抜けた後、macism の実行を待つ間、
" 少しの時間キー入力を受け付けなくなる問題がある
" これは system() の代わりに job_start() を使っても同じである
"
" augroup vimrc
"   autocmd VimEnter,VimResume,FocusGained * call s:ime_off()
"   autocmd InsertLeave * call s:save_ime_and_ime_off()
"   autocmd InsertEnter * call s:restore_ime()
" augroup END

function! s:ime_off() abort
  call job_start([s:ime_cmd, s:en_ime], {'stoponexit': ''})
endfunction

function! s:ime_on() abort
  call job_start([s:ime_cmd, s:ja_ime], {'stoponexit': ''})
endfunction

function! s:restore_ime() abort
  if s:prev_ime == s:ja_ime
    call s:ime_on()
  endif
endfunction

function! s:save_ime_and_ime_off() abort
  let s:prev_ime = trim(system(s:ime_cmd))
  call s:ime_off()
endfunction

" }}}

" Auto Completion in Cmdline {{{

augroup vimrc
  autocmd CmdlineChanged [:] call wildtrigger()
  autocmd CmdlineEnter [:] set pumopt=height:10
  autocmd CmdlineLeave [:] set pumopt=height:20
augroup END

" -- Cmdline の補完候補が選択されているかを判定する関数
function! CmdcompleteSelected() abort
  let info = cmdcomplete_info()
  let unselected = info == {} || info['selected'] == -1
  return !unselected
endfunction

" -- Cmdline の補完候補が選択されているときには確定、
"    選択されていないときには一番上の候補を選択して確定する
cnoremap <expr> <Tab> CmdcompleteSelected() ? '<CR>' : '<C-n><CR>'

" }}}

" MTGAP Mappings {{{

let s:saved_mappings = []

" augroup vimrc
"   autocmd VimEnter * call s:mtgap_on()
" augroup END

command! MtgapOn  call s:mtgap_on()
command! MtgapOff call s:mtgap_off()

function! s:mtgap_on() abort
  let s:saved_mappings = maplist()

  " Normal Mode {{{
  nmap y gR
  nmap Y J

  nmap j <C-w>
  nnoremap <C-w>j <C-w>w
  nnoremap <C-w>m <C-w>h
  nnoremap <C-w>h <C-w>j
  nnoremap <C-w>t <C-w>k
  nnoremap <C-w>s <C-w>l
  nnoremap <C-w>M <C-w>H
  nnoremap <C-w>H <C-w>J
  nnoremap <C-w>T <C-w>K
  nnoremap <C-w>S <C-w>L
  nnoremap J T

  nmap k   <Plug>(sandwich-add)
  nmap K   <Plug>(sandwich-add)$
  nmap kd  <Plug>(sandwich-delete)
  nmap kdb <Plug>(sandwich-delete-auto)
  nmap kc  <Plug>(sandwich-replace)
  nmap kcb <Plug>(sandwich-replace-auto)

  nnoremap d y
  nnoremap D y$
  nnoremap l d
  nnoremap L D

  nnoremap m h
  nnoremap h j
  nnoremap H L
  nnoremap t k
  nnoremap T H
  nnoremap s l
  nnoremap S K

  silent! nunmap f
  silent! nunmap zf
  " }}}
  " Visual Mode {{{
  xmap y  gr
  xmap Y  J

  xmap j t
  xmap J T

  xmap k  <Plug>(sandwich-add)
  xmap K  <Plug>(sandwich-add)$
  xmap kd <Plug>(sandwich-delete)
  xmap kc <Plug>(sandwich-replace)

  xnoremap d y
  xnoremap D y$
  xnoremap l d
  xnoremap L D

  xnoremap m h
  xnoremap h j
  xnoremap H L
  xnoremap t k
  xnoremap T H
  xnoremap s l
  xnoremap S K

  silent! xunmap f
  " }}}
  " Operator-pending Mode {{{
  omap y <Nop>
  omap Y <Nop>

  omap j t
  omap J T

  omap k <Plug>(sandwich-add)
  omap K <Plug>(sandwich-add)$

  onoremap d y
  onoremap D y$
  onoremap l d
  onoremap L D

  onoremap m h
  onoremap h j
  onoremap H L
  onoremap t k
  onoremap T H
  onoremap s l
  onoremap S K

  silent! ounmap f
  " }}}
endfunction

function! s:mtgap_off() abort
  if empty(s:saved_mappings)
    echohl ErrorMsg
    echomsg 'mtgap_off: 保存されたマッピングがありません'
    echohl None
    return
  endif

  mapclear

  for l:m in s:saved_mappings
    call mapset(l:m)
  endfor
endfunction

" }}}

" }}}

" COMMANDS & FUNCTIONS {{{

" Check Back Space (global) {{{

function! g:CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" }}}

" Set Status Line (global) {{{

let s:mode_map = {
      \ 'n': '  NORMAL ', 'i': '  INSERT ', 'R':      ' REPLACE ',
      \ 'v': '  VISUAL ', 'V': '  V-LINE ', "\<C-v>": ' V-BLOCK ', 'c': ' COMMAND ',
      \ 's': '  SELECT ', 'S': '  S-LINE ', "\<C-s>": ' S-BLOCK ', 't': ' TERMINAL '
      \ }

function! g:GetMode() abort
  return get(s:mode_map, mode(), '')
endfunction

function! g:SetStatusLine() abort
  let fenc = &fileencoding != '' ? &fileencoding : &encoding
  let ft   = &filetype     != '' ? &filetype     : 'no ft'

  " Percent
  let pct_num = line('.') * 100 / line('$')
  if pct_num < 10
    let percentage = '     ' .. pct_num .. '%%'
  elseif pct_num < 100
    let percentage = '    ' .. pct_num .. '%%'
  else
    let percentage = '   ' .. pct_num .. '%%'
  endif

  " Lines
  if line('.') < 10
    let lines = '    %l:'
  elseif line('.') < 100
    let lines = '   %l:'
  else
    let lines = '  %l:'
  endif

  " Columns
  if col('.') < 10
    let cols = '%c   '
  elseif col('.') < 100
    let cols = '%c  '
  else
    let cols = '%c '
  endif

  return
        \ GetMode()
        \ .. '| %t %m'
        \ .. '%='
        \ .. '%{&fileformat}' .. ' | ' .. fenc .. ' | ' .. ft
        \ .. percentage .. lines .. cols
endfunction

" }}}

" DiffOrig (tweaked) {{{

command! DiffOrig vertical new | set buftype=nofile filetype=diff
      \ | read ++edit # | 0delete_ | diffthis | wincmd p | diffthis

" }}}

" Insert Blank Lines {{{

nnoremap <expr> go <SID>blank_below()
nnoremap <expr> gO <SID>blank_above()

function! s:blank_below(type = '') abort
  if a:type == ''
    set operatorfunc=function('s:blank_below')
    return 'g@ '
  endif

  for i in range(v:count1)
    call append('.', '')
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

" }}}

" Vertical Help {{{

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

" }}}

" Syntax Info {{{

command! SyntaxInfo call s:get_syn_info()

function! s:get_syn_id(transparent)
  let synid = synID('.', col('.'), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction

function! s:get_syn_attr(synid)
  let name    = synIDattr(a:synid, 'name')
  let ctermfg = synIDattr(a:synid, 'fg', 'cterm')
  let ctermbg = synIDattr(a:synid, 'bg', 'cterm')
  let guifg   = synIDattr(a:synid, 'fg', 'gui')
  let guibg   = synIDattr(a:synid, 'bg', 'gui')
  return {
        \ 'name':    name,
        \ 'ctermfg': ctermfg,
        \ 'ctermbg': ctermbg,
        \ 'guifg':   guifg,
        \ 'guibg':   guibg
        \ }
endfunction

function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo
        \ 'name: '     .. baseSyn.name ..
        \ ' ctermfg: ' .. baseSyn.ctermfg ..
        \ ' ctermbg: ' .. baseSyn.ctermbg ..
        \ ' guifg: '   .. baseSyn.guifg ..
        \ ' guibg: '   .. baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo 'link to'
  echo
        \ 'name: '     .. linkedSyn.name ..
        \ ' ctermfg: ' .. linkedSyn.ctermfg ..
        \ ' ctermbg: ' .. linkedSyn.ctermbg ..
        \ ' guifg: '   .. linkedSyn.guifg ..
        \ ' guibg: '   .. linkedSyn.guibg
endfunction

" }}}

" Timestamp {{{

augroup vimrc
  autocmd FileType markdown nnoremap <buffer> <Leader>d <Cmd>call <SID>timestamp_below()<CR>
  autocmd FileType markdown nnoremap <buffer> <Leader>D <Cmd>call <SID>timestamp_above()<CR>
augroup END

function! s:set_timestamp() abort
  let timestamp = '## ' .. strftime('%Y-%m-%d %H:%M:%S')
  return timestamp
endfunction

function! s:timestamp_below() abort
  let timestamp = s:set_timestamp()

  if strlen(getline('.')) > 0
    call append('.', ['', timestamp, ''])
    call cursor(line('.') + 3, 1)
  elseif strlen(getline(line('.') - 1)) > 0
    call append('.', [timestamp, ''])
    call cursor(line('.') + 2, 1)
  else
    call append(line('.') - 1, timestamp)
  endif
  startinsert
endfunction

function! s:timestamp_above() abort
  let timestamp = s:set_timestamp()

  if strlen(getline('.')) > 0
    call append(line('.') - 1, timestamp)
  else
    call setline('.', timestamp)
  endif
endfunction

" }}}

" Zk Journal {{{

nnoremap <Leader>m <Nop>
nnoremap [zk] <Nop>
nmap <Leader>m [zk]
nnoremap [zk]n <Cmd>call <SID>open_journal_file()<CR>
nnoremap [zk]j <Cmd>call <SID>open_journal_dir()<CR>

let s:zk_dir = expand('$ZK_NOTEBOOK_DIR')
let s:journal_dir = s:zk_dir .. '/journal'

function! s:open_journal_file() abort
  let file_name = strftime('%Y-%m-%d') .. '.md'
  let file_path_pattern = 'zk/journal/' .. file_name
  let win_id = bufwinid(file_path_pattern)

  if win_id > 0
    call win_gotoid(win_id)
  else
    execute 'edit' s:journal_dir .. '/' .. file_name
  endif
endfunction

function! s:open_journal_dir() abort
  execute 'edit' s:journal_dir
endfunction

" }}}

" Cd Current File {{{

command! CdCurrentFile lcd %:h

" }}}

" Print tabstop, shiftwidth, softtabstop {{{

nnoremap <expr> <Leader>a <SID>print_indents()
command! PrintIndents call s:print_indents()

function! s:print_indents() abort
  let ts = &tabstop
  let sw = &shiftwidth
  let sts = &softtabstop
  echo 'tabstop: ' .. ts .. ', shiftwidth: ' .. sw .. ', softtabstop: ' .. sts
endfunction

" }}}

" Fill Line {{{

command! FillLine call s:fill_line()

function! s:fill_line() abort
  let width = 50
  let str = substitute(getline('.'), ' \+$', '', '')
  let display_width = strdisplaywidth(str)
  let sep_len = width - display_width - 1
  if sep_len < 1
    let sep_len = 1
  endif
  let sep = repeat('-', sep_len)
  call setline('.', str .. ' ' .. sep)
endfunction

" }}}

" Langmap for MTGAP {{{

" Vim に入力される文字がすでに MTGAP になっていることが前提
" Vim が Normal Mode で MTGAP の文字を Qwerty として解釈するためのマッピング

" langmap には (1) 安定性の問題と、
" (2) ユーザー定義のキーマップに対して利かない問題がある
" あるいはプラグインで定義されたキーマップに対して利かない問題
"
" (1) 安定性の問題
" 起動直後は langmap が利かなかったり、
" 初めて打ったキーに利かなかったりする（発生条件は不明）
"
" (2) ユーザー定義のキーマップに対する問題
" 例えば s を何かの機能にマッピングしている場合、langmap をオンにして
" MTGAP の S 位置のキーを押したとき、本来なら l を押したと解釈されてほしいが、
" そうはならず s が押され、s にマッピングした機能が発火してしまう
" これを回避するにはキーマップをすべて MTGAP のキー位置で書き換える必要がある
"
" 上記の理由で、今のところ以下の langmap 関連設定はうまく動作しない

" function! s:MtgapLangmapOn() abort
"   execute 'set langmap='
"      \ .. 'yq,pw,oe,ur,jt,ky,du,li,co,wp,'
"      \ .. 'ia,ns,ed,af,\\,g,mh,hj,tk,sl,r\\;,'
"      \ .. 'qz,zx,/c,.v,\\;b,bn,fm,g\\,,v.,x/,'
"      \ .. 'YQ,PW,OE,UR,JT,KY,DU,LI,CO,WP,'
"      \ .. 'IA,NS,ED,AF,<G,MH,HJ,TK,SL,R:,'
"      \ .. 'QZ,ZX,?C,>V,:B,BN,FM,G<,V>,X?'
" endfunction
"
" function! s:MtgapLangmapOff() abort
"   set langmap=
" endfunction
"
" command! MtgapOn  call s:MtgapLangmapOn()
" command! MtgapOff call s:MtgapLangmapOff()
"
" call s:MtgapLangmapOn()

" }}}

" Substitute with Last Search {{{

function! s:substitute_last_search() abort
  let cmd = mode() =~# "[vV\<C-v>]" ? ':s/' : ':%s/'
  call feedkeys(cmd .. @/ .. "//\<Left>", 'n')
endfunction

" }}}

" No/Restore Status Line {{{

command! NoStatusLine call s:no_statusline()
command! RestoreStatusLine call s:restore_statusline()

let s:saved_hl_statusline = {}

function! s:no_statusline() abort
  let s:saved_hl_statusline = hlget('StatusLine')

  highlight! link StatusLine VertSplit
  highlight! link StatusLineNC VertSplit

  set statusline=─
  set laststatus=0
  set fillchars=stl:─,stlnc:─,vert:│,fold:·,foldsep:│,eob:·
  set noruler
endfunction

function! s:restore_statusline() abort
  call hlset(s:saved_hl_statusline)

  set statusline=%!SetStatusLine()
  set laststatus=2
  set fillchars=vert:│,fold:·,foldsep:│,eob:·
  set ruler
endfunction

" }}}

" }}}

" PLUGINS {{{

" Vim-Plug {{{

let g:data_dir = has('nvim') ? stdpath('data') .. '/site' : '~/.vim'
if empty(glob(data_dir .. '/autoload/plug.vim'))
  silent execute '!curl -fLo ' .. data_dir .. '/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if has('nvim')
  call plug#begin(stdpath('data') .. '/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

nnoremap <Leader>p <Nop>
nnoremap [plug] <Nop>
nmap <Leader>p [plug]

nnoremap [plug]s <Cmd>PlugStatus<CR>
nnoremap [plug]i <Cmd>PlugInstall<CR>
nnoremap [plug]c <Cmd>PlugClean<CR>
nnoremap [plug]u <Cmd>PlugUpdate<CR>
nnoremap [plug]g <Cmd>PlugUpgrade<CR>

" }}}

" Library {{{

Plug 'vim-denops/denops.vim'

if has('nvim')
  Plug 'MunifTanjim/nui.nvim'
  Plug 'nvim-lua/plenary.nvim'
endif

" }}}

" LSP {{{

if has('nvim')
  " Plug 'neovim/nvim-lspconfig'
  " Plug 'neoclide/coc.nvim', { 'branch': 'release' }
else
  " Plug 'prabirshrestha/vim-lsp'
  " Plug 'mattn/vim-lsp-settings'
  " Plug 'mattn/vim-lsp-icons'
endif

" }}}

" Completion {{{

if has('nvim')
  " Plug 'hrsh7th/cmp-buffer'
  " Plug 'hrsh7th/cmp-cmdline'
  " Plug 'hrsh7th/cmp-nvim-lsp'
  " Plug 'hrsh7th/cmp-path'
  " Plug 'hrsh7th/cmp-vsnip'
  " Plug 'hrsh7th/nvim-cmp'
else
  " Plug 'prabirshrestha/asyncomplete.vim'
  " Plug 'prabirshrestha/asyncomplete-buffer.vim'
  " Plug 'prabirshrestha/asyncomplete-file.vim'
  " Plug 'prabirshrestha/asyncomplete-lsp.vim'
endif

" }}}

" Fuzzy Finder {{{

if has('nvim')
  " Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
  set runtimepath+=/opt/homebrew/opt/fzf
  Plug 'junegunn/fzf.vim'
else
  set runtimepath+=/opt/homebrew/opt/fzf
  Plug 'junegunn/fzf.vim'
  " Plug 'ctrlpvim/ctrlp.vim'
  " Plug 'mattn/ctrlp-matchfuzzy'
endif

" }}}

" Language Support {{{

if has('nvim')
  " Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  let g:polyglot_disabled = ['autoindent', 'sensible', 'csv', 'markdown', 'r-lang']
  Plug 'sheerun/vim-polyglot'
  Plug 'R-nvim/R.nvim', { 'for': 'r'}
else
  let g:polyglot_disabled = ['autoindent', 'sensible', 'csv', 'markdown', 'r-lang']
  Plug 'sheerun/vim-polyglot'
  Plug 'jalvesaq/Nvim-R', { 'for': 'r'}
endif

Plug 'fladson/vim-kitty',          { 'for': 'kitty' }
Plug 'kaarmu/typst.vim',           { 'for': 'typst' }
Plug 'mechatroner/rainbow_csv',    { 'for': 'csv' }
Plug 'rcmdnk/vim-markdown',        { 'for': 'markdown' }
Plug 'vim-jp/syntax-vim-ex',       { 'for': 'vim' }

" Haskell {{{

" Plug 'alx741/vim-hindent',         { 'for': 'haskell' }
" Plug 'itchyny/vim-haskell-indent', { 'for': 'haskell' }
Plug 'neovimhaskell/haskell-vim',  { 'for': 'haskell' }

" }}}

" Lisp {{{

" Plug 'guns/vim-sexp',                              { 'for': ['scheme', 'clojure'] }
" Plug 'liquidz/dps-parinfer',                       { 'for': ['scheme', 'clojure'] }
" Plug 'luochen1990/rainbow',                        { 'for': ['scheme', 'clojure'] }
" Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': ['scheme', 'clojure'] }

" }}}

" Numbat {{{

" https://github.com/sharkdp/numbat/blob/master/assets/numbat.vim
" Numbat.vim - Vim syntax file for Numbat language

if exists("b:current_syntax")
  finish
endif

" Numbat Keywords
syn keyword numbatKeywords per to let fn where and dimension unit use struct long short both none if then else true false NaN inf print assert assert_eq type
highlight default link numbatKeywords Keyword

" Physical dimensions (every capitalized word)
syn match numbatDimensions "\<\u\w*\>"
highlight default link numbatDimensions Type

" Variables and units (lowercase words)
" syn match numbatIdentifier "\<\l\w*\>"
" highlight default link numbatIdentifier Identifier

" Comments
syn match numbatComments "#.*"
highlight default link numbatComments Comment

" Digits/Numbers
syn match numbatNumber '\v<0x[0-9a-fA-F]+>'
syn match numbatNumber '\v<0o[0-7]+>'
syn match numbatNumber '\v<0b[01]+>'
syn match numbatNumber '\v<[0-9]+(_[0-9]+)*([eE][+-]?[0-9]+)?>'
syn match numbatNumber '\v<([0-9]*\.[0-9]*|[0-9]*\.[0-9]+)([eE][+-]?[0-9]+)?>'
highlight default link numbatNumber Number

" Operators
syn match numbatOperators "->\|[+*^=/\-:·⋅×÷²³<>]"
highlight default link numbatOperators Operator

" Unit decorators
syn match numbatDecorator "@\w\+"
highlight default link numbatDecorator Constant

" Special units
syn match numbatSpecialUnits "[\u00B0]" " degree symbol
highlight default link numbatSpecialUnits SpecialChar

" Strings
syntax match numbatString /"\([^"]*\)"/
highlight link numbatString String

" Load the matchit.vim script for the "%" matching, if it's available
if exists(":DoMatchIt")
  DoMatchIt
endif

setlocal comments=b:#,fb:-
setlocal commentstring=#\ %s

let b:current_syntax = "numbat"

" }}}

" }}}

" Edit {{{

Plug 'AndrewRadev/linediff.vim'
Plug 'alvan/vim-closetag'
Plug 'chrisbra/NrrwRgn'
Plug 'cohama/lexima.vim'
Plug 'godlygeek/tabular'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'kana/vim-niceblock'
Plug 'kana/vim-repeat'
Plug 'kana/vim-smartchr'
Plug 'machakann/vim-sandwich'
Plug 'mattn/vim-maketable'
Plug 'rcmdnk/yankround.vim'
Plug 'thinca/vim-quickrun'
" Plug 'vimoutliner/vimoutliner'

Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install --frozen-lockfile --production',
      \ 'for': ['html', 'css', 'less', 'scss'] }

" if has('nvim')
"   Plug 'mickael-menu/zk-nvim'
" endif

" -- Must be set before 'packadd comment'
let g:comment_mappings = v:false

packadd! comment
packadd! matchit

" Comment.vim Config {{{
nmap <Leader>c <Plug>(comment-toggle)
xmap <Leader>c <Plug>(comment-toggle)
nmap <Leader>cc <Plug>(comment-toggle-line)
nmap <Leader>C <Plug>(comment-toggle-end)

omap ic <Plug>(comment-text-object-inner)
omap ac <Plug>(comment-text-object-outer)
xmap ic <Plug>(comment-text-object-inner)
xmap ac <Plug>(comment-text-object-outer)
" }}}

" }}}

" View {{{

Plug 'itchyny/vim-highlighturl'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-peekaboo'
" Plug 'lambdalisue/glyph-palette.vim'
" Plug 'lambdalisue/nerdfont.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rbtnn/vim-ambiwidth'

if has('nvim')
  Plug 'folke/noice.nvim'
  Plug 'delphinus/auto-cursorline.nvim'
  Plug 'lewis6991/gitsigns.nvim'
else
  Plug 'delphinus/vim-auto-cursorline'
  Plug 'mhinz/vim-signify'
endif

packadd! hlyank

" Highlight-Yank Config {{{
let g:hlyank_hlgroup = 'Visual'
let g:hlyank_duration = 300
let g:hlyank_invisual = v:false
" }}}

" }}}

" Move {{{

" Plug 'MattesGroeger/vim-bookmarks'
Plug 'cocopon/vaffle.vim'
Plug 'haya14busa/vim-edgemotion'
Plug 'junegunn/vim-slash'
" Plug 'kana/vim-smartword'
" Plug 'mattn/vim-findroot'
Plug 'tyru/open-browser.vim'
Plug 'yuki-yano/fuzzy-motion.vim'

" }}}

" Operator & Text Object {{{

Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'

Plug 'kana/vim-operator-replace'
Plug 'kana/vim-textobj-line'

if has('nvim')
  Plug 'chrisgrieser/nvim-various-textobjs'
else
  Plug 'kana/vim-textobj-entire'
endif

" }}}

" Japanese Support {{{

Plug 'deton/jasegment.vim'
Plug 'deton/jasentence.vim'
" Plug 'lambdalisue/kensaku-search.vim'
" Plug 'lambdalisue/kensaku.vim'
Plug 'mattn/learn-vimscript'
Plug 'vim-jp/vimdoc-ja'

" }}}

" Colorscheme {{{

" Plug 'cocopon/iceberg.vim'
Plug 'sainnhe/edge'
Plug 'sainnhe/everforest'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/sonokai'

if has('nvim')
  Plug 'shaunsingh/nord.nvim'
else
  " Plug 'nordtheme/vim'
  Plug 'rose-pine/vim'
endif

" }}}

" Vim-Plug plug#end {{{

call plug#end()

" }}}

" Config {{{

" -- Colorscheme Config
runtime! config/colorscheme.vim

" -- Plugin Config
let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
  return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif

runtime! config/config-*.vim
if has('nvim')
  runtime! config/config-*.lua
endif

" }}}

" }}}
