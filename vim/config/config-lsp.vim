UsePlugin 'vim-lsp'

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-rename)
    inoremap <expr> <CR> pumvisible() ? '<C-y>' : '<CR>'
    " inoremap <expr> <C-n> pumvisible() ? '<Down>' : '<C-n>'
    " inoremap <expr> <C-p> pumvisible() ? '<Up>' : '<C-p>'
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 200
" let g:lsp_text_edit_enabled = 0
