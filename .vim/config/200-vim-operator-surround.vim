if empty(globpath(&runtimepath, 'plugged/vim-operator-surround'))
    finish
endif

nnoremap S <Nop>
map S <Plug>(operator-surround-append)
map Sd <Plug>(operator-surround-delete)
map Sr <Plug>(operator-surround-replace)

let g:operator#surround#blocks = {'-' : [
    \ {
        \ 'block': ['**', '**'],
        \ 'motionwise': ['char', 'line', 'block'],
        \ 'keys': ['*']
    \ },
    \ {
        \ 'block': ['（', '）'],
        \ 'motionwise': ['char', 'line', 'block'],
        \ 'keys': ['（', '）', 'm']
    \ },
    \ {
        \ 'block': ['「', '」'],
        \ 'motionwise': ['char', 'line', 'block'],
        \ 'keys': ['「', '」', 'k']
    \ },
    \ {
        \ 'block': ['『', '』'],
        \ 'motionwise': ['char', 'line', 'block'],
        \ 'keys': ['『', '』', 'K']
    \ },
\ ]}
