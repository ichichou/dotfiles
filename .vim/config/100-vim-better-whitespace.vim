if empty(globpath(&runtimepath, 'autoload/better-whitespace'))
    finish
endif

" let g:better_whitespace_filetypes_blacklist = ['diff', 'gitcommit', 'qf', 'help']
autocmd vimrc FileType diff,gitcommit,qf,help DisableWhitespace

highlight ExtraWhitespace ctermbg=DarkRed
highlight ExtraWhitespace guibg=DarkRed
