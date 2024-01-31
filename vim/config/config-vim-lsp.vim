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

" Diagnostics --------------------

if !has('nvim')
  let g:lsp_diagnostics_virtual_text_enabled = 0
endif

" let g:lsp_diagnostics_echo_cursor  = 1
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_inlay_hints_enabled      = 1
let g:lsp_diagnostics_float_insert_mode_enabled = 0

let g:lsp_diagnostics_echo_delay           = 200
let g:lsp_diagnostics_float_delay          = 200
let g:lsp_diagnostics_highlights_delay     = 200
let g:lsp_diagnostics_signs_delay          = 200
let g:lsp_diagnostics_virtual_text_delay   = 200
let g:lsp_document_code_action_signs_delay = 200
let g:lsp_inlay_hints_delay                = 200
let g:lsp_document_highlight_delay         = 200

" Semantic Highlight --------------------

let g:lsp_semantic_enabled = 1
" let g:lsp_semantic_delay   = 200

" Languages ====================

" Haskell --------------------

if executable('haskell-language-server-wrapper')
  autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'haskell-language-server-wrapper',
        \ 'cmd': {server_info->['haskell-language-server-wrapper', '--lsp']},
        \ 'root_uri': {server_info->lsp#utils#path_to_uri(
        \   lsp#utils#find_nearest_parent_file_directory(
        \     lsp#utils#get_buffer_path(),
        \     ['.cabal', 'stack.yaml', 'cabal.project', 'package.yaml', 'hie.yaml', '.git'],
        \ ))},
        \ 'whitelist': ['haskell', 'lhaskell'],
        \ })
endif
