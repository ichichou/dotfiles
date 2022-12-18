UsePlugin 'vim-sandwich'

let g:sandwich_no_default_key_mappings = 1

nmap S <Nop>
xmap S <Nop>

nmap S <Plug>(sandwich-add)
xmap S <Plug>(sandwich-add)
omap S <Plug>(sandwich-add)

nmap Sd <Plug>(sandwich-delete)
xmap Sd <Plug>(sandwich-delete)
nmap Sdb <Plug>(sandwich-delete-auto)

nmap Sc <Plug>(sandwich-replace)
xmap Sc <Plug>(sandwich-replace)
nmap Scb <Plug>(sandwich-replace-auto)

xmap ib <Plug>(textobj-sandwich-auto-i)
xmap ab <Plug>(textobj-sandwich-auto-a)
omap ib <Plug>(textobj-sandwich-auto-i)
omap ab <Plug>(textobj-sandwich-auto-a)
xmap is <Plug>(textobj-sandwich-query-i)
xmap as <Plug>(textobj-sandwich-query-a)
omap is <Plug>(textobj-sandwich-query-i)
omap as <Plug>(textobj-sandwich-query-a)
