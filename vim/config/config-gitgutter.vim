UsePlugin 'vim-gitgutter'

let g:gitgutter_map_keys = 0

nnoremap <Leader>h <Nop>
nnoremap [gitgutter] <Nop>
nmap <Leader>h [gitgutter]

nnoremap <silent> [gitgutter]j <Cmd>GitGutterNextHunk<CR>
nnoremap <silent> [gitgutter]k <Cmd>GitGutterPrevHunk<CR>
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

nnoremap <silent> [gitgutter]p <Cmd>GitGutterPreviewHunk<CR>
nnoremap <silent> [gitgutter]t <Cmd>GitGutterLineHighlightsToggle<CR>
nnoremap <silent> [gitgutter]s <Cmd>GitGutterStagewHunk<CR>
nnoremap <silent> [gitgutter]u <Cmd>GitGutterUndoHunk<CR>
