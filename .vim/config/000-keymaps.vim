" ========================================
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
" noremap / /\v

noremap j gj
noremap k gk
noremap gj j
noremap gk k

noremap Y y$
noremap x "_x
noremap X "_X

noremap + <C-a>
noremap - <C-x>

nnoremap <silent> <C-j> :<C-u>bnext<CR>
nnoremap <silent> <C-k> :<C-u>bprevious<CR>
" nnoremap <silent> <C-x> :<C-u>bdelete<CR>

cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" set termwinkey=<C-g>
" tnoremap <F1> <C-\><C-n>

if has('gui_running')
    nnoremap <silent> <Leader><Leader> :<C-u>edit $MYVIMRC<CR>
    nnoremap <silent> <Leader><lt> :<C-u>edit $MYGVIMRC<CR>
    nnoremap <silent> <Leader>. :<C-u>source $MYVIMRC<CR> :source $MYGVIMRC<CR>
else
    nnoremap <silent> <Leader><Leader> :<C-u>edit $MYVIMRC<CR>
    nnoremap <silent> <Leader>. :<C-u>source $MYVIMRC<CR>
endif

nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>
nnoremap <silent> <Leader>r :<C-u>redraw!<CR>
nnoremap <silent> <Leader>t :<C-u>vertical terminal ++close<CR>

" --------------------
" Nop
" --------------------

noremap ZZ <Nop>
noremap ZQ <Nop>
noremap Q <Nop>
noremap gQ <Nop>
noremap <Del> <Nop>

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
\ silent! call repeat#set("go", v:count1)<CR>

nnoremap <silent> gO :<C-u>for i in range(1, v:count1) \|
\ call append(line('.')-1, '') \| endfor \|
\ silent! call repeat#set("gO", v:count1)<CR>

" --------------------
" Window/Tabpage/Buffer
" --------------------

nnoremap t <Nop>
nnoremap [window] <Nop>
nmap t [window]

nnoremap [window]/ :<C-u>vertical help<Space>

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

nnoremap <silent> [window]t :<C-u>tabnew<CR>
nnoremap <silent> [window]q :<C-u>tabclose<CR>
nnoremap [window]n gt
nnoremap [window]p gT
nnoremap <silent> [window]N :<C-u>+tabmove<CR>
nnoremap <silent> [window]P :<C-u>-tabmove<CR>

nnoremap <silent> [window]] :<C-u>bnext<CR>
nnoremap <silent> [window][ :<C-u>bprevious<CR>
