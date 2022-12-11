UsePlugin 'vim-textobj-user'

call textobj#user#plugin('jbrackets', {
  \ 'parens': {
    \ 'pattern': ['（', '）'],
    \ 'select-a': 'aP',
    \ 'select-i': 'iP'
  \ },
  \ 'braces': {
    \ 'pattern': ['「', '」'],
    \ 'select-a': 'aB',
    \ 'select-i': 'iB'
  \ },
  \ 'doublebraces': {
    \ 'pattern': ['『', '』'],
    \ 'select-a': 'aD',
    \ 'select-i': 'iD'
  \ }
\ })
