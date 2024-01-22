UsePlugin 'vim-lsp'

function! s:OnLspBufferEnabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <Plug>(lsp-definition)
  nmap <buffer> gr <Plug>(lsp-rename)
endfunction

augroup lsp_install
  autocmd!
  autocmd User lsp_buffer_enabled call s:OnLspBufferEnabled()
augroup END

" Completion
" let g:lsp_preview_float = 0
" let g:lsp_text_edit_enabled = 0
" let g:lsp_completion_documentation_enabled = 0
" let g:lsp_preview_max_width = 200
" let g:lsp_preview_max_height = 100

" Diagnostics
" let g:lsp_diagnostics_enabled = 0
let g:lsp_diagnostics_echo_cursor  = 1
let g:lsp_diagnostics_echo_delay   = 200
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_float_delay  = 200
let g:lsp_diagnostics_signs_delay  = 200
let g:lsp_diagnostics_virtual_text_delay   = 200
let g:lsp_document_code_action_signs_delay = 200
let g:lsp_inlay_hints_enabled = 1
" let g:lsp_inlay_hints_delay = 200
" let g:lsp_document_highlight_delay = 200

" Semantic Highlight
" let g:lsp_semantic_enabled = 1
" let g:lsp_semantic_delay   = 200
