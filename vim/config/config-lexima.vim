UsePlugin 'lexima.vim'

let g:lexima_ctrlh_as_backspace = 1
" let g:lexima_accept_pum_with_enter = 1
" let g:lexima_map_escape = ''

" Initialize lexima to remap <CR>
let g:lexima_no_default_rules = 1
call lexima#set_default_rules()

" Remap <CR> with completion plugin
if FindPlugin('asyncomplete.vim')
  inoremap <silent><expr> <CR> pumvisible() ?
     \ asyncomplete#close_popup() :
     \ '<C-r>=lexima#expand("<LT>CR>", "i")<CR>'
elseif FindPlugin('ddc.vim') && FindPlugin('pum.vim')
  inoremap <silent><expr> <CR> pum#visible() ?
     \ '<Cmd>call pum#map#confirm()<CR>' :
     \ '<C-r>=lexima#expand("<LT>CR>", "i")<CR>'
endif
