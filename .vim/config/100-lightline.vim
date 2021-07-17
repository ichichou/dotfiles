if empty(globpath(&runtimepath, 'plugged/lightline.vim'))
    finish
endif

" powerline wombat jellybeans solarized PaperColor seoul256 Dracula one landscape
" hybrid iceberg tender tenderplus nord

if has('gui_running')
    let g:lightline = {
        \ 'colorscheme': 'iceberg',
        \ 'active': {
            \ 'left': [
                \ ['mode', 'paste'],
                \ ['readonly', 'filename', 'modified']
            \ ],
            \ 'right': [
                \ ['lineinfo'],
                \ ['percent'],
                \ ['fileformat', 'fileencoding', 'filetype']
            \ ]
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
                \ ['readonly', 'filename', 'modified']
            \ ],
            \ 'right': [
                \ ['lineinfo'],
                \ ['percent'],
                \ ['fileformat', 'fileencoding', 'filetype']
            \ ]
        \ },
        \ 'component_function': {
            \ 'filepath': 'FilePath'
        \ }
    \ }
endif

function! FilePath()
    if winwidth(0) > 70
        return expand('%:p')
    else
        return expand('%:t')
    endif
endfunction

let g:lightline.tabline = {
    \ 'left': [['tabs']],
    \ 'right': [['']],
\ }
