UsePlugin 'vim-highlightedyank'

nmap y <Plug>(highlightedyank)
xmap y <Plug>(highlightedyank)
omap y <Plug>(highlightedyank)
nmap Y <Plug>(highlightedyank)$

let g:highlightedyank_highlight_duration = 200
let g:highlightedyank_highlight_in_visual = 0
let g:highlightedyank_max_lines = 1000
