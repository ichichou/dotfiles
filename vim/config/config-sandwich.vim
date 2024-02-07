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

nmap sd  <Plug>(sandwich-delete)
xmap sd  <Plug>(sandwich-delete)
nmap sdb <Plug>(sandwich-delete-auto)

nmap sr  <Plug>(sandwich-replace)
xmap sr  <Plug>(sandwich-replace)
nmap srb <Plug>(sandwich-replace-auto)

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
      \ { 'buns': ['**', '**'], 'input': ['*'], 'filetype': ['markdown'] },
      \ { 'buns': ['（', '）'], 'input': ['j('] },
      \ { 'buns': ['「', '」'], 'input': ['j['] },
      \ { 'buns': ['『', '』'], 'input': ['j{'] },
      \ { 'buns': ['〈', '〉'] },
      \ { 'buns': ['《', '》'] },
      \ { 'buns': ['【', '】'] },
      \ { 'buns': ['〔', '〕'] },
      \ { 'buns': ['［', '］'] },
      \ { 'buns': ['｛', '｝'] },
      \ { 'buns': ['‘', '’'] },
      \ { 'buns': ['“', '”'] },
      \ ]
