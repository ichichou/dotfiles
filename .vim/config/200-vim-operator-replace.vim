if empty(globpath(&runtimepath, 'autoload/operator-replace'))
    finish
endif

map R <Plug>(operator-replace)
