UsePlugin 'ddc.vim'

call ddc#custom#patch_global('ui', 'native')
call ddc#custom#patch_global('completionMenu', 'pum.vim')

" Sources
call ddc#custom#patch_global('sources', ['around', 'vim-lsp'])

" Source Options (global)
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'matchers': ['matcher_head'],
      \   'sorters': ['sorter_rank'],
      \   'converters': ['converter_remove_overlap'],
      \ },
      \ 'around': { 'mark': 'A' },
      \ 'vim-lsp': { 'mark': 'LSP' },
      \ })

call ddc#custom#patch_global('sourceParams', {
      \ 'around': { 'maxSize': 500 },
      \ })

" Source Options (filetype local)
call ddc#custom#patch_filetype(['markdown'], 'sourceParams', {
      \ 'around': { 'maxSize': 100 },
      \ })

" Keymap
" inoremap <expr> <Tab> pum#visible() ?
"       \ '<Cmd>call pum#map#insert_relative(+1)<CR>' :
"       \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
"       \ '<Tab>' : ddc#map#manual_complete()
" inoremap <expr> <S-Tab> pum#visible() ?
"       \ '<Cmd>call pum#map#insert_relative(-1)<CR>' : '<C-h>'

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <expr> <Tab> pum#visible() ?
      \ '<Cmd>call pum#map#insert_relative(+1)<CR>' :
      \ <SID>check_back_space() ? '<Tab>' : ddc#map#manual_complete()
inoremap <expr> <S-Tab> pum#visible() ?
      \ '<Cmd>call pum#map#insert_relative(-1)<CR>' : '<C-h>'

" With YankRound, EdgeMotion...
inoremap <expr> <C-n> pum#visible() ?
      \ '<Cmd>call pum#map#select_relative(+1)<CR>' : yankround#is_active() ?
      \ '<Plug>(yankround-next)' : '<SID>(c-n)'
inoremap <expr> <C-p> pum#visible() ?
      \ '<Cmd>call pum#map#select_relative(-1)<CR>' : yankround#is_active() ?
      \ '<Plug>(yankround-prev)' : '<SID>(c-p)'

nmap <silent> <SID>(c-n) <Plug>(edgemotion-j)
nmap <silent> <SID>(c-p) <Plug>(edgemotion-k)
vmap <silent> <C-n> <Plug>(edgemotion-j)
vmap <silent> <C-p> <Plug>(edgemotion-k)

inoremap <expr> <C-y> pum#visible() ?
      \ '<Cmd>call pum#map#confirm()<CR>' : '<C-y>'
inoremap <expr> <C-e> pum#visible() ?
      \ '<Cmd>call pum#map#cancel()<CR>' : '<C-e>'

if !FindPlugin('lexima.vim')
  inoremap <silent><expr> <CR> pum#visible() ?
        \ '<Cmd>call pum#map#confirm()<CR>' : '<CR>'
endif
" If exists lexima, <CR> is mapped in config-lexima.vim

call ddc#enable()
