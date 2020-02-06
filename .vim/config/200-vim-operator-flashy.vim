if empty(globpath(&runtimepath, 'autoload/operator-flashy'))
    finish
endif

map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$
