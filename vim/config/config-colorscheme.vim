" Hybrid
let g:hybrid_custom_term_colors = 1
" let g:lightline_hybrid_style = 'plain'

" Nord
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

" Everforest
let g:everforest_background = 'medium'
let g:everforest_better_performance = 1

" Sonokai
let g:sonokai_style = 'default'
let g:sonokai_better_performance = 1

" Colorscheme
set background=dark
let s:colorscheme = 'everforest'

execute 'colorscheme' s:colorscheme
let g:lightline_colorscheme = s:colorscheme
" if ! exists('g:lightline')
"     let g:lightline = {}
" endif
" let g:lightline.colorscheme = s:colorscheme
