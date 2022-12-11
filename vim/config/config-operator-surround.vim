UsePlugin 'vim-operator-surround'

nnoremap S <Nop>
map S <Plug>(operator-surround-append)
map Sd <Plug>(operator-surround-delete)
map Sc <Plug>(operator-surround-replace)

let g:operator#surround#blocks = {'-' : [
    \ {
        \ 'block': ['**', '**'],
        \ 'motionwise': ['char', 'line', 'block'],
        \ 'keys': ['*']
    \ },
    \ {
        \ 'block': ['（', '）'],
        \ 'motionwise': ['char', 'line', 'block'],
        \ 'keys': ['p']
    \ },
    \ {
        \ 'block': ['「', '」'],
        \ 'motionwise': ['char', 'line', 'block'],
        \ 'keys': ['b']
    \ },
    \ {
        \ 'block': ['『', '』'],
        \ 'motionwise': ['char', 'line', 'block'],
        \ 'keys': ['d']
    \ },
\ ]}
