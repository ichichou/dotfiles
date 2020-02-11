if empty(globpath(&runtimepath, 'plugged/vaffle.vim'))
    finish
endif

let g:vaffle_auto_cd = 1
let g:vaffle_show_hidden_files = 1

nnoremap <silent> <Leader>v :<C-u>Vaffle<CR>
