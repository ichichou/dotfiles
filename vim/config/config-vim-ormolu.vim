UsePlugin 'vim-ormolu'

let g:ormolu_commwnd = 'fourmolu'
let g:ormolu_suppress_stderr = 1
" let g:ormolu_options = ['']

command! -nargs=0 Fourmolu call RunOrmolu()
