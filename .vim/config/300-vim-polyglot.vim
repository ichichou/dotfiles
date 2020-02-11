if empty(globpath(&runtimepath, 'plugged/vim-polyglot'))
    finish
endif

let g:polyglot_disabled = ['markdown', 'csv']
