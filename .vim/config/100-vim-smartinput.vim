if empty(globpath(&runtimepath, 'plugged/vim-smartinput'))
    finish
endif

call smartinput#map_to_trigger('i', '（', '（', '（')
call smartinput#map_to_trigger('i', '「', '「', '「')
call smartinput#map_to_trigger('i', '『', '『', '『')
call smartinput#map_to_trigger('i', '〈', '〈', '〈')
call smartinput#map_to_trigger('i', '【', '【', '【')
call smartinput#map_to_trigger('i', '［', '［', '［')
call smartinput#map_to_trigger('i', '｛', '｛', '｛')
call smartinput#map_to_trigger('i', '）', '）', '）')
call smartinput#map_to_trigger('i', '」', '」', '」')
call smartinput#map_to_trigger('i', '』', '』', '』')
call smartinput#map_to_trigger('i', '〉', '〉', '〉')
call smartinput#map_to_trigger('i', '】', '】', '】')
call smartinput#map_to_trigger('i', '］', '］', '］')
call smartinput#map_to_trigger('i', '｝', '｝', '｝')

call smartinput#define_rule({
    \ 'at': '\s\+\%#',
    \ 'char': '<CR>',
    \ 'input': "<C-o>:call setline('.', substitute(getline('.'), '\\s\\+$', '', ''))<CR><CR>",})

call smartinput#define_rule({'at': '(\%#)', 'char': '<Space>', 'input': '<Space><Space><Left>'})
call smartinput#define_rule({'at': '{\%#}', 'char': '<Space>', 'input': '<Space><Space><Left>'})
call smartinput#define_rule({'at': '\[\%#\]', 'char': '<Space>', 'input': '<Space><Space><Left>'})
call smartinput#define_rule({'at': '<\%#>', 'char': '<Space>', 'input': '<Space><Space><Left>'})

call smartinput#define_rule({'at': '( \%# )', 'char': '<BS>', 'input': '<BS><Del>'})
call smartinput#define_rule({'at': '{ \%# }', 'char': '<BS>', 'input': '<BS><Del>'})
call smartinput#define_rule({'at': '\[ \%# \]', 'char': '<BS>', 'input': '<BS><Del>'})
call smartinput#define_rule({'at': '< \%# >', 'char': '<BS>', 'input': '<BS><Del>'})

call smartinput#define_rule({'at': '\%#', 'char': '（', 'input': '（）<Left>'})
call smartinput#define_rule({'at': '\%#', 'char': '「', 'input': '「」<Left>'})
call smartinput#define_rule({'at': '\%#', 'char': '『', 'input': '『』<Left>'})
call smartinput#define_rule({'at': '\%#', 'char': '〈', 'input': '〈〉<Left>'})
call smartinput#define_rule({'at': '\%#', 'char': '【', 'input': '【】<Left>'})
call smartinput#define_rule({'at': '\%#', 'char': '［', 'input': '［］<Left>'})
call smartinput#define_rule({'at': '\%#', 'char': '｛', 'input': '｛｝<Left>'})

call smartinput#define_rule({'at': '（.*\%#）', 'char': '）', 'input': '<Right>'})
call smartinput#define_rule({'at': '「.*\%#」', 'char': '」', 'input': '<Right>'})
call smartinput#define_rule({'at': '『.*\%#』', 'char': '』', 'input': '<Right>'})
call smartinput#define_rule({'at': '〈.*\%#〉', 'char': '〉', 'input': '<Right>'})
call smartinput#define_rule({'at': '【.*\%#】', 'char': '】', 'input': '<Right>'})
call smartinput#define_rule({'at': '［.*\%#］', 'char': '］', 'input': '<Right>'})
call smartinput#define_rule({'at': '｛.*\%#｝', 'char': '｝', 'input': '<Right>'})

call smartinput#define_rule({'at': '（\%#）', 'char': '<BS>', 'input': '<BS><Del>'})
call smartinput#define_rule({'at': '「\%#」', 'char': '<BS>', 'input': '<BS><Del>'})
call smartinput#define_rule({'at': '『\%#』', 'char': '<BS>', 'input': '<BS><Del>'})
call smartinput#define_rule({'at': '〈\%#〉', 'char': '<BS>', 'input': '<BS><Del>'})
call smartinput#define_rule({'at': '【\%#】', 'char': '<BS>', 'input': '<BS><Del>'})
call smartinput#define_rule({'at': '［\%#］', 'char': '<BS>', 'input': '<BS><Del>'})
call smartinput#define_rule({'at': '｛\%#｝', 'char': '<BS>', 'input': '<BS><Del>'})

call smartinput#define_rule({'at': '（）\%#', 'char': '<BS>', 'input': '<BS><BS>'})
call smartinput#define_rule({'at': '「」\%#', 'char': '<BS>', 'input': '<BS><BS>'})
call smartinput#define_rule({'at': '『』\%#', 'char': '<BS>', 'input': '<BS><BS>'})
call smartinput#define_rule({'at': '〈〉\%#', 'char': '<BS>', 'input': '<BS><BS>'})
call smartinput#define_rule({'at': '【】\%#', 'char': '<BS>', 'input': '<BS><BS>'})
call smartinput#define_rule({'at': '［］\%#', 'char': '<BS>', 'input': '<BS><BS>'})
call smartinput#define_rule({'at': '｛｝\%#', 'char': '<BS>', 'input': '<BS><BS>'})
