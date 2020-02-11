if empty(globpath(&runtimepath, 'plugged/ale'))
    finish
endif

let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
" let g:ale_lint_on_filetype_changed = 0
" let g:ale_lint_on_save = 0

" let g:ale_sign_column_always = 1
" let g:ale_sign_error = '!'
" g:ale_sign_warning = '?'

" let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_linters = {
    \ 'html': ['htmlhint'],
    \ 'javascript': ['eslint'],
    \ 'python': ['flake8'],
\ }
let g:ale_fixers = {
    \ 'html': ['prettier'],
    \ 'javascript': ['eslint'],
    \ 'python': ['black', 'isort'],
\ }

let g:ale_python_flake8_options = ''
let g:ale_python_black_options = ''

function! s:ale_list()
    let g:ale_open_list = 1
    call ale#Queue(0, 'lint_file')
endfunction
command! ALEList call s:ale_list()

augroup vimrc
    autocmd FileType qf nnoremap <silent> <buffer> q :let g:ale_open_list = 0<CR>:q!<CR>
    autocmd FileType help,qf,man,ref let b:ale_enabled = 0
augroup END

nnoremap <Leader>a <Nop>
nnoremap [ale] <Nop>
nmap <Leader>a [ale]

nmap <silent> [ale]t <Plug>(ale_toggle)
nmap <silent> [ale]f <Plug>(ale_fix)
nnoremap <silent> [ale]l :ALEList<CR>

nmap <silent> [ale]] <Plug>(ale_next)
nmap <silent> [ale][ <Plug>(ale_previous)
nmap ]a <Plug>(ale_next)
nmap [a <Plug>(ale_previous)
