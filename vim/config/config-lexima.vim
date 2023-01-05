UsePlugin 'lexima.vim'

let g:lexima_ctrlh_as_backspace = 1
" let g:lexima_accept_pum_with_enter = 1
" let g:lexima_map_escape = ''

" Initialize lexima to remap <CR>
let g:lexima_no_default_rules = 1
call lexima#set_default_rules()

call lexima#add_rule({'char': '<BS>', 'at': '（\%#）', 'input': '<BS>', 'delete': 1})
call lexima#add_rule({'char': '<BS>', 'at': '「\%#」', 'input': '<BS>', 'delete': 1})
call lexima#add_rule({'char': '<BS>', 'at': '『\%#』', 'input': '<BS>', 'delete': 1})
call lexima#add_rule({'char': '<BS>', 'at': '〈\%#〉', 'input': '<BS>', 'delete': 1})
call lexima#add_rule({'char': '<BS>', 'at': '【\%#】', 'input': '<BS>', 'delete': 1})

call lexima#add_rule({'char': '<BS>', 'at': '（）\%#', 'input': '<BS><BS>'})
call lexima#add_rule({'char': '<BS>', 'at': '「」\%#', 'input': '<BS><BS>'})
call lexima#add_rule({'char': '<BS>', 'at': '『』\%#', 'input': '<BS><BS>'})
call lexima#add_rule({'char': '<BS>', 'at': '〈〉\%#', 'input': '<BS><BS>'})
call lexima#add_rule({'char': '<BS>', 'at': '【】\%#', 'input': '<BS><BS>'})

call lexima#add_rule({'char': '（', 'at': '\%#$', 'input_after': '）'})
call lexima#add_rule({'char': '「', 'at': '\%#$', 'input_after': '」'})
call lexima#add_rule({'char': '『', 'at': '\%#$', 'input_after': '』'})

call lexima#add_rule({'char': '）', 'at': '\%#）', 'leave': 1})
call lexima#add_rule({'char': '」', 'at': '\%#」', 'leave': 1})
call lexima#add_rule({'char': '』', 'at': '\%#』', 'leave': 1})

inoremap <silent><expr> <CR>
      \ pum#visible() ? pum#map#confirm() :
      \ pumvisible() ? '<C-y>' :
      \ lexima#expand('<LT>CR>', 'i')

if FindPlugin('asyncomplete.vim')
  inoremap <silent><expr> <CR> pumvisible() ?
        \ asyncomplete#close_popup() : lexima#expand('<LT>CR>', 'i')
endif
