UsePlugin 'asyncomplete.vim'

let g:asyncomplete_auto_completeopt = 0
" If 1, set completeopt=menuone,noinsert,noselect

" let g:asyncomplete_min_chars = 2
" let g:asyncomplete_popup_delay = 200

" If exists Lexima, <CR> is mapped in config-lexima.vim
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
inoremap <silent> <expr> <S-TAB> pumvisible()
      \ ? '<C-p>'
      \ : '<C-h>'
