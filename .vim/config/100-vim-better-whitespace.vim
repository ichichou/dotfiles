if empty(globpath(&runtimepath, 'plugged/vim-better-whitespace'))
    finish
endif

let g:better_whitespace_filetypes_blacklist = ['diff', 'gitcommit', 'qf', 'help']
" autocmd vimrc FileType diff,gitcommit,qf,help DisableWhitespace

let g:better_whitespace_ctermcolor = "DarkRed"
let g:better_whitespace_guicolor = "DarkRed"
" highlight ExtraWhitespace ctermbg=DarkRed
" highlight ExtraWhitespace guibg=DarkRed
