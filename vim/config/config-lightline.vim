UsePlugin 'lightline.vim'

let g:lightline = {
    \ 'colorscheme': 'everforest',
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
        \ 'mode': 'LightlineMode',
        \ 'filepath': 'LightlineFilePath'
    \ }
\ }

let g:lightline.tabline = {
    \ 'left': [['tabs']],
    \ 'right': [['']],
\ }

function! LightlineMode()
    if winwidth(0) > 70
        return g:lightline#mode()
    else
        return g:lightline#mode()[0]
    endif
endfunction

function! LightlineFilePath()
    if winwidth(0) > 70
        return expand('%:p')
    else
        return expand('%:t')
    endif
endfunction
