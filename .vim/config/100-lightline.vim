if empty(globpath(&runtimepath, 'autoload/lightline.vim'))
    finish
endif

" powerline wombat jellybeans solarized PaperColor seoul256 Dracula one landscape
" hybrid iceberg tender tenderplus nord

if has('gui_running')
    let g:lightline = {
        \ 'colorscheme': 'hybrid',
        \ 'active': {
            \ 'left': [
                \ ['mode', 'paste'],
                \ ['readonly', 'filepath', 'modified']
            \ ],
            \ 'right': [
                \ ['lineinfo'],
                \ ['percent'],
                \ ['fileformat', 'fileencoding', 'filetype']
            \ ]
        \ },
        \ 'component': {
            \ 'percent': '%3p%% [%LL]'
        \ },
        \ 'component_function': {
            \ 'filepath': 'FilePath'
        \ }
    \ }
else
    let g:lightline = {
        \ 'colorscheme': 'iceberg',
        \ 'active': {
            \ 'left': [
                \ ['mode', 'paste'],
                \ ['readonly', 'filepath', 'modified']
            \ ],
            \ 'right': [
                \ ['lineinfo'],
                \ ['percent'],
                \ ['fileformat', 'fileencoding', 'filetype']
            \ ]
        \ },
        \ 'component': {
            \ 'percent': '%3p%% [%LL]'
        \ },
        \ 'component_function': {
            \ 'filepath': 'FilePath'
        \ }
    \ }
endif

function! FilePath()
    if winwidth(0) > 70
        return expand('%:s')
    else
        return expand('%:t')
    endif
endfunction

let g:lightline.tabline = {
    \ 'left': [['tabs']],
    \ 'right': [['']],
\ }
