UsePlugin 'vim-easymotion'

let g:EasyMotion_do_mapping  = 0
let g:EasyMotion_smartcase   = 1
let g:EasyMotion_startofline = 0
" let g:EasyMotion_use_migemo  = 1
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1

let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ASDFGHJKL;QWERTYUIOPZXCVBNM,.'
" let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTASDGZXCVBJF'

" map  S <Plug>(easymotion-bd-f2)
" nmap S <Plug>(easymotion-overwin-f2)
map  <Leader>s <Plug>(easymotion-bd-f2)
nmap <Leader>s <Plug>(easymotion-overwin-f2)

" map f <Plug>(easymotion-bd-fl)
" map F <Plug>(easymotion-bd-fl)
