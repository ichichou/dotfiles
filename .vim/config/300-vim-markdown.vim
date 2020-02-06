if empty(globpath(&runtimepath, 'autoload/vim-markdown'))
    finish
endif

let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_conceal = 0

highlight link htmlItalic LineNr
highlight link htmlBold WarningMsg
highlight link htmlBoldItalic ErrorMsg
