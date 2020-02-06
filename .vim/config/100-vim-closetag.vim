if empty(globpath(&runtimepath, 'autoload/vim-closetag'))
    finish
endif

let g:closetag_filetypes = 'html,xhtml,phtml,xml,markdown'
