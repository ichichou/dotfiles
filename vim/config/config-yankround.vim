UsePlugin 'yankround.vim'

let g:yankround_max_history   = 100
let g:yankround_use_region_hl = 1
let g:yankround_region_hl_groupname = 'Visual'

map p  <Plug>(yankround-p)
map P  <Plug>(yankround-P)
map gp <Plug>(yankround-gp)
map gP <Plug>(yankround-gP)

nmap <expr>   <C-n> yankround#is_active() ? '<Plug>(yankround-next)' : '<Plug>(edgemotion-j)'
nmap <expr>   <C-p> yankround#is_active() ? '<Plug>(yankround-prev)' : '<Plug>(edgemotion-k)'
vmap <silent> <C-n> <Plug>(edgemotion-j)
vmap <silent> <C-p> <Plug>(edgemotion-k)
