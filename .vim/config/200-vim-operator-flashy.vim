if empty(globpath(&runtimepath, 'plugged/vim-operator-flashy'))
    finish
endif

map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$
