UsePlugin 'vim-sandwich'

let g:sandwich_no_default_key_mappings = 1

nmap s <Nop>
xmap s <Nop>

nmap s <Plug>(sandwich-add)
xmap s <Plug>(sandwich-add)
omap s <Plug>(sandwich-add)
nmap S <Plug>(sandwich-add)$
xmap S <Plug>(sandwich-add)$
omap S <Plug>(sandwich-add)$

nmap sd <Plug>(sandwich-delete)
xmap sd <Plug>(sandwich-delete)
nmap sdb <Plug>(sandwich-delete-auto)

nmap sc <Plug>(sandwich-replace)
xmap sc <Plug>(sandwich-replace)
nmap scb <Plug>(sandwich-replace-auto)

xmap ib <Plug>(textobj-sandwich-auto-i)
xmap ab <Plug>(textobj-sandwich-auto-a)
omap ib <Plug>(textobj-sandwich-auto-i)
omap ab <Plug>(textobj-sandwich-auto-a)
xmap is <Plug>(textobj-sandwich-query-i)
xmap as <Plug>(textobj-sandwich-query-a)
omap is <Plug>(textobj-sandwich-query-i)
omap as <Plug>(textobj-sandwich-query-a)

let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [
      \ {'buns': ['**', '**'], 'input': ['*'], 'filetype': ['markdown']},
      \ {'buns': ['（', '）'], 'input': ['p']},
      \ {'buns': ['「', '」'], 'input': ['b']},
      \ {'buns': ['『', '』'], 'input': ['d']},
      \ {'buns': ['〈', '〉']},
      \ {'buns': ['《', '》']},
      \ {'buns': ['【', '】']},
      \ {'buns': ['〔', '〕']},
      \ {'buns': ['［', '］']},
      \ {'buns': ['｛', '｝']},
      \ {'buns': ['‘', '’']},
      \ {'buns': ['“', '”']},
      \ ]
