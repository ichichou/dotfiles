UsePlugin 'ddc.vim'

call ddc#custom#patch_global('ui', 'pum')
call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('autoCompleteEvents', [
      \ 'InsertEnter', 'TextChangedI', 'TextChangedP', 'CmdlineChanged',
      \ ])
call ddc#custom#patch_global('sources', ['vim-lsp', 'vsnip', 'omni', 'around'])

call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'matchers': ['matcher_head'],
      \   'sorters': ['sorter_rank'],
      \   'converters': ['converter_remove_overlap'],
      \   'ignoreCase': v:true,
      \ },
      \ 'vim-lsp': {
      \   'mark': 'LSP',
      \   'minAutoCompleteLength': 1,
      \ },
      \ 'vsnip': {
      \   'mark': 'VS',
      \   'minAutoCompleteLength': 1,
      \   'dup': v:true,
      \ },
      \ 'omni': { 'mark': 'O' },
      \ 'around': { 'mark': 'A' },
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
function! s:exists_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! s:imap_tab() abort
  if FindPlugin('pum.vim')
    if pum#visible()
      return pum#map#insert_relative(+1)
    elseif vsnip#jumpable(1)
      return '<Plug>(vsnip-jump-next)'
    elseif !s:exists_back_space()
      return ddc#map#manual_complete()
    else
      return '<Tab>'
    endif

  elseif !FindPlugin('pum.vim')
    if pumvisible()
      return '<C-n>'
    elseif vsnip#jumpable(1)
      return '<Plug>(vsnip-jump-next)'
    elseif !s:exists_back_space()
      return ddc#map#manual_complete()
    else
      return '<Tab>'
    endif
  endif
endfunction

function! s:imap_shift_tab() abort
  if FindPlugin('pum.vim')
    if pum#visible()
      return pum#map#insert_relative(-1)
    elseif vsnip#jumpable(-1)
      return '<Plug>(vsnip-jump-prev)'
    else
      return '<C-d>'
    endif

  elseif !FindPlugin('pum.vim')
    if pumvisible()
      return '<C-p>'
    elseif vsnip#jumpable(-1)
      return '<Plug>(vsnip-jump-prev)'
    else
      return '<C-d>'
    endif
  endif
endfunction

function! s:imap_ctrl_e() abort
  if FindPlugin('pum.vim')
    if pum#visible()
      return pum#map#cancel()
    else
      return '<Cmd>call cursor(0, col("$"))<CR>'
    endif

  elseif !FindPlugin('pum.vim')
    if pumvisible()
      return ddc#hide('Manual')
    else
      return '<Cmd>call cursor(0, col("$"))<CR>'
    endif
  endif
endfunction

if FindPlugin('pum.vim')
  imap <expr> <Tab>
        \ pum#visible()             ? pum#map#insert_relative(+1) :
        \ vsnip#jumpable(1)         ? '<Plug>(vsnip-jump-next)'   :
        \ !<SID>exists_back_space() ? ddc#map#manual_complete()   :
        \ '<Tab>'
  imap <expr> <S-Tab>
        \ pum#visible()      ? pum#map#insert_relative(-1) :
        \ vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)'   :
        \ '<C-d>'
  inoremap <expr> <C-e>
        \ pum#visible() ? pum#map#cancel() :
        \ '<Cmd>call cursor(0, col("$"))<CR>'
  inoremap <expr> <C-y>   pum#visible() ? pum#map#confirm() : '<C-y>'
  inoremap <expr> <C-n>   pum#map#insert_relative(+1)
  inoremap <expr> <C-p>   pum#map#insert_relative(-1)
  inoremap <expr> <Down>  pum#visible() ? pum#map#select_relative(+1) : '<Down>'
  inoremap <expr> <Up>    pum#visible() ? pum#map#select_relative(-1) : '<Up>'
endif

if !FindPlugin('pum.vim')
  imap <expr> <Tab>
        \ pumvisible()              ? '<C-n>'                   :
        \ vsnip#jumpable(1)         ? '<Plug>(vsnip-jump-next)' :
        \ !<SID>exists_back_space() ? ddc#map#manual_complete() :
        \ '<Tab>'
  imap <expr> <S-Tab>
        \ pumvisible()       ? '<C-p>'                   :
        \ vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' :
        \ '<C-d>'
  inoremap <expr> <C-e>
        \ pumvisible() ? ddc#hide('Manual') :
        \ '<Cmd>call cursor(0, col("$"))<CR>'
endif

" imap <expr> <Tab>   <SID>imap_tab()
" imap <expr> <S-Tab> <SID>imap_shift_tab()
" imap <expr> <C-e>   <SID>imap_ctrl_e()
smap <expr> <Tab>   vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'

" Commandline
" ----------------------------------------
noremap ; <Cmd>call CmdlinePre()<CR>:

function! CmdlinePre() abort
  cnoremap <expr> <Tab>   pum#visible() ? pum#map#insert_relative(+1) :
        \ ddc#map#manual_complete()
  cnoremap <expr> <S-Tab> pum#map#insert_relative(-1)
  cnoremap <expr> <C-e>   pum#visible() ? pum#map#cancel() : '<C-e>'
  cnoremap <expr> <C-y>   pum#map#confirm()
  cnoremap <expr> <C-n>   pum#map#insert_relative(+1)
  cnoremap <expr> <C-p>   pum#map#insert_relative(-1)
  " cnoremap <expr> <CR>    pum#visible() ? pum#map#confirm() . '<CR>' : '<CR>'

  " Overwrite sources
  if !exists('b:prev_buffer_config')
    let b:prev_buffer_config = ddc#custom#get_buffer()
  endif
  call ddc#custom#patch_buffer('cmdlineSources', ['cmdline', 'cmdline-history', 'around'])
  call ddc#custom#patch_buffer('sourceOptions', {
        \ '_': { 'minAutoCompleteLength': 2 },
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
  silent! cunmap <C-n>
  silent! cunmap <C-p>
  silent! cunmap <C-y>
  silent! cunmap <C-e>
  " silent! cunmap <CR>

  " Restore sources
  if exists('b:prev_buffer_config')
    call ddc#custom#set_buffer(b:prev_buffer_config)
    unlet b:prev_buffer_config
  else
    call ddc#custom#set_buffer({})
  endif
endfunction

" Enable ddc.vim
" ----------------------------------------
call ddc#enable()
