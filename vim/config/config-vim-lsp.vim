UsePlugin 'vim-lsp'

" SETUP  =========================================

augroup lsp_install
  autocmd!
  autocmd User lsp_setup call s:lsp_setup()
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes

  nmap <buffer> gd <Plug>(lsp-definition)
  nmap <buffer> gr <Plug>(lsp-rename)
  nmap <buffer> gq <Plug>(lsp-document-format)
  vmap <buffer> gq <Plug>(lsp-document-range-format)

  let g:lsp_format_sync_timeout = 1000
endfunction

" CONFIG =========================================

" DIAGNOSTICS ------------------------------------

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

" SEMANTIC HIGHLIGHT -----------------------------

let g:lsp_semantic_enabled = 1
" let g:lsp_semantic_delay   = 200

" LANGUAGES ======================================

" HASKELL ----------------------------------------

function! s:lsp_setup() abort
  if executable('haskell-language-server-wrapper')
    call lsp#register_server({
          \ 'name': 'haskell-language-server-wrapper',
          \ 'cmd': { server_info->['haskell-language-server-wrapper', '--lsp'] },
          \ 'allowlist': ['haskell', 'lhaskell'],
          \ 'root_uri': { server_info->lsp#utils#path_to_uri(
          \   lsp#utils#find_nearest_parent_file_directory(
          \     lsp#utils#get_buffer_path(),
          \     ['.cabal', 'stack.yaml', 'cabal.project', 'package.yaml', 'hie.yaml', '.git'],
          \ ))},
          \ 'workspace_config': {
          \   'haskell': {
          \     'formattingProvider': 'fourmolu',
          \     'plugin': {
          \       'fourmolu': {
          \         'config': {
          \           'external': v:true,
          \ }}}}},
          \ })
  endif
endfunction
