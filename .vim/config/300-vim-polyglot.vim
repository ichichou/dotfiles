if empty(globpath(&runtimepath, 'autoload/vim-polyglot'))
    finish
endif

let g:polyglot_disabled = ['markdown', 'csv']
