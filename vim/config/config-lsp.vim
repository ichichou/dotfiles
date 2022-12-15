UsePlugin 'vim-lsp'

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <Plug>(lsp-definition)
  nmap <buffer> gr <Plug>(lsp-rename)
endfunction

augroup lsp_install
  autocmd!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Completion
" let g:lsp_preview_float = 0
" let g:lsp_text_edit_enabled = 0
" let g:lsp_completion_documentation_enabled = 0
" let g:lsp_preview_max_width = 200
" let g:lsp_preview_max_height = 100

" Diagnostics
" let g:lsp_diagnostics_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_echo_delay = 200
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_float_delay = 200
let g:lsp_diagnostics_signs_delay = 200
let g:lsp_diagnostics_virtual_text_delay = 200
let g:lsp_document_code_action_signs_delay = 200
let g:lsp_inlay_hints_enabled = 1
" let g:lsp_inlay_hints_delay = 200
" let g:lsp_document_highlight_delay = 200

" Semantic Highlight
" let g:lsp_semantic_enabled = 1
" let g:lsp_semantic_delay = 200

" Asyncomplete
if FindPlugin('asyncomplete.vim')
  " let g:asyncomplete_auto_completeopt = 0
  " let g:asyncomplete_auto_popup = 0
  " let g:asyncomplete_popup_delay = 200
  " let g:asyncomplete_min_chars = 0

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  inoremap <silent> <expr> <CR>
    \ pumvisible() ? asyncomplete#close_popup() : '<CR>'
  inoremap <silent> <expr> <TAB>
    \ pumvisible() ? '<C-n>' :
    \ <SID>check_back_space() ? '<TAB>' :
    \ asyncomplete#force_refresh()
  inoremap <expr> <S-TAB> pumvisible() ? '<C-p>' : '<C-h>'
endif
