UsePlugin 'vim-smartchr'

inoremap <expr> + smartchr#loop(' + ', '+')
inoremap <expr> - smartchr#loop(' - ', '-')
inoremap <expr> = smartchr#loop(' = ', ' == ', '=')
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
  inoremap <buffer> <expr> + smartchr#loop(' + ', ' ++ ', '+')
  inoremap <buffer> <expr> - smartchr#loop(' - ', '-- ',  '-')
  inoremap <buffer> <expr> : smartchr#loop(':', ' :: ')
endfunction

function! s:julia_map() abort
  inoremap <buffer> <expr> <Bslash> smartchr#loop('<Bslash>', 'function ')
endfunction

function! s:markdown_map() abort
  iunmap +
  iunmap -
  inoremap <buffer> <expr> = smartchr#loop('=', ' = ')
endfunction

function! s:r_map() abort
  inoremap <buffer> <expr> _ smartchr#loop('_', ' <lt>- ')
  inoremap <buffer> <expr> > smartchr#loop('>', ' <Bar>> ')
endfunction

function! s:vim_map() abort
  iunmap +
  iunmap -
  inoremap <buffer> <expr> . smartchr#loop('.', ' .. ')
  inoremap <buffer> <expr> : smartchr#loop(':', 'command! ')
  inoremap <buffer> <expr> <Bslash><Bslash> smartchr#loop('function! ', '<Bslash><Bslash>')
endfunction
