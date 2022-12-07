UsePlugin 'vim-repeat'

let g:repeat_no_default_key_mappings = 1

nmap . <Plug>(repeat-.)
nmap u <Plug>(repeat-u)
nmap U <Plug>(repeat-<C-r>)
nmap <C-r> <Plug>(repeat-<C-r>)
nmap g- <Plug>(repeat-g-)
nmap g+ <Plug>(repeat-g+)
