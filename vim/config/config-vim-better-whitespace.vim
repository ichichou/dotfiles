UsePlugin 'vim-better-whitespace'

let g:better_whitespace_filetypes_blacklist = ['diff', 'git', 'gitcommit', 'qf', 'help']

let g:strip_whitelines_at_eof = 1
let g:show_spaces_that_precede_tabs = 1
" let g:strip_whitespace_on_save = 1
" let g:current_line_whitespace_disabled_soft = 1

" let g:better_whitespace_ctermcolor = 'DarkRed'
" let g:better_whitespace_guicolor = 'DarkRed'

nnoremap <Leader>S <Cmd>StripWhitespace<CR>
vnoremap <Leader>S <Cmd>StripWhitespace<CR>
