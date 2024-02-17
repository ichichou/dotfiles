UsePlugin 'vim-smartchr'

inoremap <expr> _ smartchr#loop('_', ' -> ', ' <lt>- ')

augroup smartchr
  autocmd!
  autocmd FileType haskell  call s:haskell_map()
  autocmd FileType julia    call s:julia_map()
  autocmd FileType markdown call s:markdown_map()
  autocmd FileType r        call s:r_map()
  autocmd FileType vim      call s:vim_map()
augroup END

function! s:haskell_map() abort
  inoremap <buffer> <expr> : smartchr#loop(':', ' :: ')
  inoremap <buffer> <expr> o smartchr#loop('o', 'otherwise')
  inoremap <buffer> <expr> w smartchr#loop('w', 'where')
endfunction

function! s:julia_map() abort
  inoremap <buffer> <expr> <Bslash> smartchr#loop('<Bslash>', 'function ')
  inoremap <buffer> <expr> f smartchr#loop('f', 'function ')
endfunction

function! s:markdown_map() abort
endfunction

function! s:r_map() abort
  inoremap <buffer> <expr> _ smartchr#loop('_', ' <lt>- ')
  inoremap <buffer> <expr> > smartchr#loop('>', ' <Bar>> ')
  inoremap <buffer> <expr> i smartchr#loop('i', ' <lt>- ')
  inoremap <buffer> <expr> m smartchr#loop('m', ' <Bar>> ')
endfunction

function! s:vim_map() abort
  inoremap <buffer> <expr> : smartchr#loop(':', 'command! ')
  inoremap <buffer> <expr> f smartchr#loop('f', 'function! ')
endfunction
