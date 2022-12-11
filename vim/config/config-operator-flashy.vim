UsePlugin 'vim-operator-flashy'

let g:operator#flashy#flash_time = 200
let g:operator#flashy#group = 'Visual'

map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$
