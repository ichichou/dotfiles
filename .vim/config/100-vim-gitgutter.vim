if !executable("git")
    finish
endif

if empty(globpath(&runtimepath, 'plugged/vim-gitgutter'))
    finish
endif

set updatetime=250

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

nnoremap <Leader>h <Nop>
nnoremap [gitgutter] <Nop>
nmap <Leader>h [gitgutter]

nnoremap <silent> [gitgutter]j :<C-u>GitGutterNextHunk<CR>
nnoremap <silent> [gitgutter]k :<C-u>GitGutterPrevHunk<CR>
nnoremap <silent> [gitgutter]h :<C-u>GitGutterLineHighlightsToggle<CR>
nnoremap <silent> [gitgutter]p :<C-u>GitGutterPreviewHunk<CR>
nnoremap <silent> [gitgutter]s :<C-u>GitGutterStagewHunk<CR>
nnoremap <silent> [gitgutter]u :<C-u>GitGutterUndoHunk<CR>
