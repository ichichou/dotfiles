if empty(globpath(&runtimepath, 'plugged/jasegment.vim'))
    finish
endif

call jasegment#define(
    \'nonblank', {
        \ 'move-n': 'gW',
        \ 'move-p': 'gB',
        \ 'move-N': 'gE',
        \ 'select-i': 'iE',
        \ 'select-a': 'aE',
    \ }
\ )
