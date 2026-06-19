UsePlugin 'yankround.vim'

let g:yankround_max_history   = 100
let g:yankround_use_region_hl = 1
let g:yankround_region_hl_groupname = 'Visual'

nmap p  <Plug>(yankround-p)
nmap P  <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)

xmap p  <Plug>(yankround-p)
xmap P  <Plug>(yankround-P)
xmap gp <Plug>(yankround-gp)
xmap gP <Plug>(yankround-gP)

nmap <expr> <C-n> yankround#is_active() ? '<Plug>(yankround-next)' : '<Plug>(edgemotion-j)'
nmap <expr> <C-p> yankround#is_active() ? '<Plug>(yankround-prev)' : '<Plug>(edgemotion-k)'
