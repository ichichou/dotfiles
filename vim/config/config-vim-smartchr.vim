UsePlugin 'vim-smartchr'

inoremap <expr> _ smartchr#loop('_', '->', '<-')

augroup smartchr
  autocmd!
  autocmd FileType r inoremap <buffer> <expr> _ smartchr#loop('_', '<-')
  autocmd FileType r inoremap <buffer> <expr> > smartchr#loop('>', '\|>')
augroup END
