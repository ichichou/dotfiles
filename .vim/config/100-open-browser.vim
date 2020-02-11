if empty(globpath(&runtimepath, 'plugged/open-browser.vim'))
    finish
endif

let g:netrw_nogx = 1

map gx <Plug>(openbrowser-smart-search)
