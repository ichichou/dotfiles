UsePlugin 'vim-signify'

nnoremap <Leader>g <Nop>
nnoremap [signify] <Nop>
nmap <Leader>g [signify]

nmap [signify]j <Plug>(signify-next-hunk)
nmap [signify]k <Plug>(signify-prev-hunk)

nmap [signify]n <Plug>(signify-next-hunk)
nmap [signify]p <Plug>(signify-prev-hunk)

nmap [signify]d <Cmd>SignifyHunkDiff<CR>
nmap [signify]u <Cmd>SignifyHunkUndo<CR>

function! s:ShowCurrentHunk() abort
  let h = sy#util#get_hunk_stats()
  if !empty(h)
    echo printf('[Hunk %d/%d]', h.current_hunk, h.total_hunks)
  endif
endfunction
