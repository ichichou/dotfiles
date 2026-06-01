UsePlugin 'ale'

let g:ale_linters_explicit = v:true
let g:ale_virtualtext_cursor = 'current'
" let g:ale_sign_column_always = v:true
" let g:ale_warn_about_trailing_whitespace = 0
" let g:ale_fix_on_save = 1

let g:ale_linters = #{
      \ typescript: ['eslint'],
      \ }

let g:ale_fixers = #{
      \ typescript: ['eslint'],
      \ }
