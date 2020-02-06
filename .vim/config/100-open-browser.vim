if empty(globpath(&runtimepath, 'autoload/open-browser'))
    finish
endif

let g:netrw_nogx = 1

map gx <Plug>(openbrowser-smart-search)
