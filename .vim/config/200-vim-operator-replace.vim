if empty(globpath(&runtimepath, 'plugged/vim-operator-replace'))
    finish
endif

map R <Plug>(operator-replace)
