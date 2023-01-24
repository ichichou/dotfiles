UsePlugin 'vim-signify'

nmap <Leader>gj <Plug>(signify-next-hunk)
nmap <Leader>gk <Plug>(signify-prev-hunk)
nmap <Leader>gJ 9999<Leader>gj
nmap <Leader>gK 9999<Leader>gk

nmap <Leader>gp <Cmd>SignifyHunkDiff<CR>
nmap <Leader>gu <Cmd>SignifyHunkUndo<CR>

function! s:show_current_hunk() abort
  let h = sy#util#get_hunk_stats()
  if !empty(h)
    echo printf('[Hunk %d/%d]', h.current_hunk, h.total_hunks)
  endif
endfunction
