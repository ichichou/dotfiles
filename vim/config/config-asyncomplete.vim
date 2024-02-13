UsePlugin 'asyncomplete.vim'

" If 1, set completeopt=menuone,noinsert,noselect
let g:asyncomplete_auto_completeopt = 0

" let g:asyncomplete_min_chars = 2
let g:asyncomplete_popup_delay = 200

" KEYMAPS ----------------------------------------

" If exists Lexima, <CR> is mapped in config-lexima.vim
if !FindPlugin('lexima.vim')
  inoremap <silent> <expr> <CR> pumvisible()
        \ ? asyncomplete#close_popup()
        \ : '<CR>'
endif

inoremap <silent> <expr> <TAB> pumvisible()
      \ ? '<C-n>'
      \ : CheckBackSpace()
      \   ? '<TAB>'
      \   : asyncomplete#force_refresh()
inoremap <silent> <expr> <S-TAB> pumvisible()
      \ ? '<C-p>'
      \ : '<C-h>'

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

  if FindPlugin( 'asyncomplete-buffer.vim' )
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
