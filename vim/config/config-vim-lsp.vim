UsePlugin 'vim-lsp'

" SETUP  {{{

augroup lsp_install
  autocmd!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
  autocmd User lsp_setup call s:lsp_setup()
augroup END

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

  setlocal foldmethod=expr
  setlocal foldexpr=lsp#ui#vim#folding#foldexpr()
  setlocal foldtext=lsp#ui#vim#folding#foldtext()

  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gs <plug>(lsp-document-symbol-search)
  nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
  " nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  " nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <plug>(lsp-next-diagnostic)
  " nmap <buffer> K <plug>(lsp-hover)
  nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
  nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

  let g:lsp_format_sync_timeout = 1000
  autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction

" }}}

" CONFIG {{{

let g:lsp_log_file = expand('~/vim-lsp.log')

let g:lsp_use_native_client = 1

" let g:lsp_semantic_enabled = 1
" let g:lsp_semantic_delay   = 200

let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_echo_delay  = 200

let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_float_delay  = 200
" let g:lsp_diagnostics_float_insert_mode_enabled = 0

let g:lsp_diagnostics_virtual_text_enabled = 1
let g:lsp_diagnostics_virtual_text_delay   = 200

let g:lsp_inlay_hints_enabled = 1
let g:lsp_inlay_hints_delay   = 200

let g:lsp_diagnostics_highlights_delay     = 200
let g:lsp_diagnostics_signs_delay          = 200
let g:lsp_document_code_action_signs_delay = 200
let g:lsp_document_highlight_delay         = 200

" }}}

" LANGUAGES {{{

function! s:lsp_setup() abort
  " -- Haskell
  if executable('haskell-language-server-wrapper')
    call lsp#register_server({
          \ 'name': 'haskell-language-server-wrapper',
          \ 'cmd': { server_info->['haskell-language-server-wrapper', '--lsp'] },
          \ 'allowlist': ['haskell', 'lhaskell'],
          \ 'root_uri': { server_info->lsp#utils#path_to_uri(
          \   lsp#utils#find_nearest_parent_file_directory(
          \     lsp#utils#get_buffer_path(),
          \     [
          \       '.cabal',
          \       'stack.yaml',
          \       'cabal.project',
          \       'package.yaml',
          \       'hie.yaml',
          \       '.git'
          \     ],
          \   )
          \ )},
          \ 'workspace_config': {
          \   'haskell': {
          \     'formattingProvider': 'fourmolu',
          \     'plugin': {
          \       'fourmolu': {
          \         'config': {
          \           'external': v:true,
          \          }
          \       }
          \     }
          \   }
          \ },
          \ })
  endif
endfunction

" -- Typescript & Javascript (on vim-lsp-settings)
let g:lsp_settings_filetype_typescript = ['typescript-language-server']
let g:lsp_settings_filetype_javascript = ['typescript-language-server']

" }}}
