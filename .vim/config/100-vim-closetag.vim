if empty(globpath(&runtimepath, 'plugged/vim-closetag'))
    finish
endif

let g:closetag_filetypes = 'html,xhtml,phtml,xml,markdown'
