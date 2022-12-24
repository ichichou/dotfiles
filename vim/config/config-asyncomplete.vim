UsePlugin 'asyncomplete.vim'

" let g:asyncomplete_auto_completeopt = 0
" let g:asyncomplete_auto_popup = 0
" let g:asyncomplete_popup_delay = 200
" let g:asyncomplete_min_chars = 0

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

if !FindPlugin('lexima.vim')
  inoremap <silent><expr> <CR> pumvisible() ?
        \ asyncomplete#close_popup() : '<CR>'
endif
" If exists lexima, <CR> is mapped in config-lexima.vim

inoremap <silent><expr> <TAB> pumvisible() ?
      \ '<C-n>' : <SID>check_back_space() ?
      \ '<TAB>' : asyncomplete#force_refresh()
inoremap <expr> <S-TAB> pumvisible() ?
      \ '<C-p>' : '<C-h>'
