UsePlugin 'asyncomplete.vim'

" -- Auto Completion
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_popup_delay = 200
let g:asyncomplete_min_chars = 2

" -- Manual Completion
let g:asyncomplete_auto_popup = 0
let g:asyncomplete_popup_delay = 0

" -- If 1, set completeopt=menuone,noinsert,noselect
let g:asyncomplete_auto_completeopt = 0

" KEYMAPS ----------------------------------------

" -- If exists Lexima, <CR> is mapped in config-lexima.vim
if !FindPlugin('lexima.vim')
  inoremap <silent> <expr> <CR> pumvisible()
        \ ? asyncomplete#close_popup()
        \ : '<CR>'
endif

inoremap <silent> <expr> <TAB>
      \ pumvisible()       ? '<C-n>'
      \ : CheckBackSpace() ? '<C-t>'
      \ : asyncomplete#force_refresh()
inoremap <silent> <expr> <S-TAB> pumvisible()
      \ ? '<C-p>'
      \ : '<C-d>'

inoremap <silent> <expr> <C-n> pumvisible()
      \ ? '<C-n>'
      \ : asyncomplete#force_refresh()

inoremap <silent> <expr> <C-p> pumvisible()
      \ ? '<C-p>'
      \ : asyncomplete#force_refresh()

" SOURCES ----------------------------------------

augroup asyncomplete
  autocmd!
  autocmd User asyncomplete_setup call s:asyncomplete_setup()
augroup END

function! s:asyncomplete_setup() abort

  if FindPlugin('asyncomplete-file.vim')
    call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
          \ 'name': 'file',
          \ 'allowlist': ['*'],
          \ 'priority': 10,
          \ 'completor': function('asyncomplete#sources#file#completor'),
          \ }))
  endif

  if FindPlugin('asyncomplete-buffer.vim')
    call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
          \ 'name': 'buffer',
          \ 'allowlist': ['*'],
          \ 'blocklist': ['go'],
          \ 'completor': function('asyncomplete#sources#buffer#completor'),
          \ 'config': {
          \   'max_buffer_size': 5000000,
          \ },
          \ }))
  endif

endfunction
