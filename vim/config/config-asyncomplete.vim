UsePlugin 'asyncomplete.vim'

" let g:asyncomplete_auto_completeopt = 0
" let g:asyncomplete_auto_popup = 0
" let g:asyncomplete_popup_delay = 200
" let g:asyncomplete_min_chars = 0

" If exists lexima, <CR> is mapped in config-lexima.vim
if !FindPlugin('lexima.vim')
  inoremap <silent> <expr> <CR> pumvisible()
        \ ? asyncomplete#close_popup()
        \ : '<CR>'
endif

inoremap <silent> <expr> <TAB> pumvisible()
      \ ? '<C-n>'
      \ : CheckBackSpace()
      \   ? '<TAB>'
      \   : asyncomplete#force_refresh()
inoremap <expr> <S-TAB> pumvisible()
      \ ? '<C-p>'
      \ : '<C-h>'
