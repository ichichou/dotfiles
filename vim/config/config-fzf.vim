UsePlugin 'fzf.vim'

" let g:fzf_layout = {'down': '40%'}
" let g:fzf_preview_window = ['right,50%', 'ctrl-/']
" let g:fzf_preview_window = ['right,50%,<70(up,40%)', 'ctrl-/']
let g:fzf_buffers_jump = 1

nnoremap <Leader>f <Nop>
nnoremap [fzf] <Nop>
nmap <Leader>f [fzf]

nnoremap [fzf]b <Cmd>Buffers<CR>
nnoremap [fzf]c <Cmd>Colors<CR>
nnoremap [fzf]f <Cmd>Files<CR>
nnoremap [fzf]g <Cmd>Rg<CR>
nnoremap [fzf]h <Cmd>History<CR>
nnoremap [fzf]l <Cmd>Lines<CR>
nnoremap [fzf]m <Cmd>Marks<CR>
nnoremap [fzf]r <Cmd>Registers<CR>
nnoremap [fzf]t <Cmd>Filetypes<CR>

nnoremap <Leader>b <Cmd>Buffers<CR>
nnoremap <Leader>t <Cmd>Files<CR>
nnoremap <Leader>h <Cmd>History<CR>

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Rg
      \ call fzf#vim#grep('rg --column --line-number'
      \ .. ' --no-heading --color=always --smart-case -- '
      \ .. shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)

" Registers
function! s:FzfRegisters() abort
  let reg  = execute('registers')
  let regs = split(reg, '\n')
  call remove(regs, 0)
  call fzf#run({'source': regs, 'sink': funcref('s:Paste'), 'window': {'width': 0.9, 'height': 0.5}})
  " call fzf#run({'source': regs, 'sink': funcref('s:Paste'), 'down': '30%'})
endfunction

function! s:Paste(sink) abort
  execute 'normal!' strcharpart(a:sink, 5, 2) .. 'p'
endfunction

command! -nargs=0 Registers call s:FzfRegisters()
