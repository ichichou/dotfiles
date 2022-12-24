UsePlugin 'ddc.vim'

" call ddc#custom#patch_global('ui', 'native')
call ddc#custom#patch_global('ui', 'pum')
call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('autoCompleteEvents', [
      \ 'InsertEnter', 'TextChangedI', 'TextChangedP', 'CmdlineChanged',
      \ ])
call ddc#custom#patch_global('sources', ['around', 'vim-lsp', 'vsnip'])

call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'matchers': ['matcher_head'],
      \   'sorters': ['sorter_rank'],
      \   'converters': ['converter_remove_overlap'],
      \   'ignoreCase': v:true,
      \ },
      \ 'around': { 'mark': 'A' },
      \ 'vsnip': { 'mark': 'SNIP' },
      \ 'vim-lsp': {
      \   'mark': 'LSP',
      \   'minAutoCompleteLength': 1,
      \ },
      \ })

call ddc#custom#patch_global('sourceParams', {
      \ 'around': { 'maxSize': 500 },
      \ })

call ddc#custom#patch_filetype(['markdown'], 'sourceParams', {
      \ 'around': { 'maxSize': 100 },
      \ })

autocmd vimrc User PumCompleteDone call vsnip_integ#on_complete_done(g:pum#completed_item)

" Keymap
" ----------------------------------------
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

if !FindPlugin('pum.vim')
  inoremap <expr> <Tab> pumvisible() ? '<C-n>' :
        \ <SID>check_back_space() ? '<Tab>' :
        \ ddc#map#manual_complete()
  inoremap <expr> <S-Tab> pumvisible() ? '<C-p>' : '<C-d>'
  inoremap <expr> <C-e> pumvisible() ? ddc#hide('Manual') : '<C-e>'
  " inoremap <expr> <CR> pumvisible() ? '<C-y>' : '<CR>'
else
  inoremap <expr> <Tab> pum#visible() ? pum#map#insert_relative(+1) :
        \ <SID>check_back_space() ? '<Tab>' :
        \ ddc#map#manual_complete()
  inoremap <expr> <S-Tab> pum#visible() ? pum#map#insert_relative(-1) :
        \ '<C-d>'
  inoremap <expr> <C-n> pum#visible() ? pum#map#insert_relative(+1) : '<C-n>'
  inoremap <expr> <C-p> pum#visible() ? pum#map#insert_relative(-1) : '<C-p>'
  inoremap <expr> <Down> pum#visible() ? pum#map#select_relative(+1) : '<Down>'
  inoremap <expr> <Up> pum#visible() ? pum#map#select_relative(-1) : '<Up>'
  inoremap <expr> <C-y> pum#visible() ? pum#map#confirm() : '<C-y>'
  inoremap <expr> <C-e> pum#visible() ? pum#map#cancel() : '<C-e>'
  " inoremap <expr> <CR> pum#visible() ? pum#map#confirm() : '<CR>'
endif

" Commandline Completion
" ----------------------------------------
noremap : <Cmd>call CmdlinePre()<CR>:

function! CmdlinePre() abort
  cnoremap <expr> <Tab> pum#visible() ? pum#map#insert_relative(+1) : ddc#map#manual_complete()
  cnoremap <expr> <S-Tab> pum#map#insert_relative(-1)
  " cnoremap <expr> <C-n> pum#map#insert_relative(+1)
  " cnoremap <expr> <C-p> pum#map#insert_relative(-1)
  cnoremap <expr> <Down> pum#map#insert_relative(+1)
  cnoremap <expr> <Up> pum#map#insert_relative(-1)
  cnoremap <expr> <C-y> pum#map#confirm()
  cnoremap <expr> <C-e> pum#map#cancel()

  " Overwrite sources
  if !exists('b:prev_buffer_config')
    let b:prev_buffer_config = ddc#custom#get_buffer()
  endif
  call ddc#custom#patch_buffer('cmdlineSources', ['cmdline', 'cmdline-history', 'around'])
  call ddc#custom#patch_buffer('sourceOptions', {
        \ '_': { 'minAutoCompleteLength': 1 },
        \ 'cmdline': { 'mark': 'CMD' },
        \ 'cmdline-history': { 'mark': 'HIST' },
        \ })

  autocmd User DDCCmdlineLeave ++once call CmdlinePost()
  autocmd InsertEnter <buffer> ++once call CmdlinePost()

  " Enable command line completion
  call ddc#enable_cmdline_completion()
endfunction

function! CmdlinePost() abort
  silent! cunmap <Tab>
  silent! cunmap <S-Tab>
  " silent! cunmap <C-n>
  " silent! cunmap <C-p>
  silent! cunmap <Down>
  silent! cunmap <Up>
  silent! cunmap <C-y>
  silent! cunmap <C-e>

  " Restore sources
  if exists('b:prev_buffer_config')
    call ddc#custom#set_buffer(b:prev_buffer_config)
    unlet b:prev_buffer_config
  else
    call ddc#custom#set_buffer({})
  endif
endfunction

" Skkeleton
" ----------------------------------------
function! s:skkeleton_pre() abort
  let s:prev_buffer_config = ddc#custom#get_buffer()
  call ddc#custom#patch_buffer('sources', ['skkeleton'])
  call ddc#custom#patch_buffer('sourceOptions', {
        \ '_': { 'minAutoCompleteLength': 1 },
        \ 'skkeleton': { 'mark': 'SKK' },
        \ })
endfunction

function! s:skkeleton_post() abort
  call ddc#custom#set_buffer(s:prev_buffer_config)
endfunction

augroup ddc
  autocmd!
  autocmd User skkeleton-enable-pre call s:skkeleton_pre()
  autocmd User skkeleton-disable-pre call s:skkeleton_post()
augroup END

" Enable ddc.vim
" ----------------------------------------
call ddc#enable()
