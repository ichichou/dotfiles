UsePlugin 'fzf.vim'

" let g:fzf_layout = {'down': '~60%'}
" let g:fzf_preview_window = ['right,50%', 'ctrl-/']
" let g:fzf_preview_window = ['right,50%,<70(up,40%)', 'ctrl-/']
let g:fzf_buffers_jump = 1

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case -- ' . shellescape(<q-args>),
  \ 1, fzf#vim#with_preview(), <bang>0)

nnoremap <Leader>f <Nop>
nnoremap [fzf] <Nop>
nmap <Leader>f [fzf]

nnoremap <silent> [fzf]b <Cmd>Buffers<CR>
nnoremap <silent> [fzf]c <Cmd>Colors<CR>
nnoremap <silent> [fzf]f <Cmd>Files<CR>
nnoremap <silent> [fzf]h <Cmd>History<CR>
nnoremap <silent> [fzf]l <Cmd>Lines<CR>
nnoremap <silent> [fzf]m <Cmd>Marks<CR>
nnoremap <silent> [fzf]r <Cmd>Rg<CR>
nnoremap <silent> [fzf]t <Cmd>Filetypes<CR>

nnoremap <silent> <Leader>b <Cmd>Buffers<CR>
