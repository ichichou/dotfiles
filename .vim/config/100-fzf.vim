if !executable("fzf")
    finish
endif

if empty(globpath(&runtimepath, 'plugged/fzf.vim'))
    finish
endif

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
