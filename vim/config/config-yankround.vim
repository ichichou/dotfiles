UsePlugin 'yankround.vim'

let g:yankround_max_history = 100
let g:yankround_use_region_hl = 1

map p <Plug>(yankround-p)
map P <Plug>(yankround-P)
map gp <Plug>(yankround-gp)
map gP <Plug>(yankround-gP)

nnoremap <silent> <SID>(c-n) <Cmd>bnext<CR>
nnoremap <silent> <SID>(c-p) <Cmd>bprevious<CR>
nmap <expr> <C-n> yankround#is_active() ? '<Plug>(yankround-next)' : '<SID>(c-n)'
nmap <expr> <C-p> yankround#is_active() ? '<Plug>(yankround-prev)' : '<SID>(c-p)'
