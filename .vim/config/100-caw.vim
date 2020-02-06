if empty(globpath(&runtimepath, 'autoload/caw.vim'))
    finish
endif

map <Leader>c <Plug>(caw:hatpos:toggle)
map <Leader>0 <Plug>(caw:zeropos:toggle)
