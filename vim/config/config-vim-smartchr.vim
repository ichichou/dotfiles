UsePlugin 'vim-smartchr'

inoremap <expr> _ smartchr#loop('_', '->', '<lt>-')

augroup smartchr
  autocmd!
  autocmd FileType haskell  call s:haskell_map()
  autocmd FileType julia    call s:julia_map()
  autocmd FileType markdown call s:markdown_map()
  autocmd FileType r        call s:r_map()
  autocmd FileType vim      call s:vim_map()
augroup END

function! s:haskell_map() abort
  inoremap <buffer> <expr> <lt> smartchr#loop('<lt>', '<lt>-', '=<lt><lt>', '<lt><lt>')
  inoremap <buffer> <expr> > smartchr#loop('>', '->', '>>=', '>>')
  inoremap <buffer> <expr> = smartchr#loop('=', '==', '=>>')
  inoremap <buffer> <expr> W smartchr#loop('W', 'where')
  inoremap <buffer> <expr> O smartchr#loop('O', 'otherwise = ')
endfunction

function! s:julia_map() abort
  inoremap <buffer> <expr> F smartchr#loop('F', 'function ')
endfunction

function! s:markdown_map() abort
endfunction

function! s:r_map() abort
  inoremap <buffer> <expr> _ smartchr#loop('_', '<lt>-', '->')
  inoremap <buffer> <expr> <lt> smartchr#loop('<lt>', '<lt>-', '<lt><lt>')
  inoremap <buffer> <expr> > smartchr#loop('>', '<Bar>>', '>>')
  inoremap <buffer> <expr> I smartchr#loop('I', '<lt>-')
  inoremap <buffer> <expr> M smartchr#loop('M', '<Bar>>')
endfunction

function! s:vim_map() abort
  inoremap <buffer> <expr> C smartchr#loop('C', 'command! ')
  inoremap <buffer> <expr> F smartchr#loop('F', 'function! ')
endfunction
