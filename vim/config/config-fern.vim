UsePlugin 'fern.vim'

let g:fern#default_hidden    = 1
let g:fern#keepalt_on_edit   = 1
let g:fern#keepjumps_on_edit = 1

if FindPlugin('fern-renderer-nerdfont.vim')
  let g:fern#renderer = 'nerdfont'
endif

nnoremap <silent> <Leader>v <Cmd>Fern %:h<CR>
" nnoremap <silent> <Leader>v <Cmd>Fern %:h -drawer -keep -toggle<CR>

" nnoremap <silent> <Leader>v <Cmd>Fern . -reveal=%<CR>
" nnoremap <silent> <Leader>v <Cmd>Fern . -reveal=% -drawer -keep -toggle<CR>

function! s:init_fern() abort
  nnoremap <buffer> q <Cmd>quit!<CR>
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END
