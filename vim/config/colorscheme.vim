" Hybrid -----------------------------------------

let g:hybrid_custom_term_colors = 1
" let g:lightline_hybrid_style = 'plain'

" nordtheme/vim ----------------------------------

let g:nord_italic    = 0
let g:nord_underline = 1

" shaunsingh/nord.nvim ---------------------------

let g:nord_borders = 1

" Everforest -------------------------------------

let g:everforest_background = 'medium'
let g:everforest_better_performance = 1

" Sonokai ----------------------------------------

let g:sonokai_style = 'default'
let g:sonokai_better_performance = 1

" Edge -------------------------------------------

let g:edge_style = 'default'
let g:edge_better_performance = 1

" Gruvbox-Material -------------------------------

let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_foreground = 'material'
let g:gruvbox_material_better_performance = 1

" Define highlights ------------------------------

function! s:define_highlights() abort
  highlight! link htmlItalic LineNr
  highlight! link htmlBold WarningMsg
  highlight! link htmlBoldItalic ErrorMsg
  highlight! link HighlightedyankRegion Visual
  highlight! link ExtraWhitespace Visual
endfunction

augroup def-highlights
  autocmd!
  autocmd ColorScheme * call s:define_highlights()
augroup END

" Colorscheme ------------------------------------

set background=dark

if has('nvim')
  let s:colorscheme = 'nord'
else
  let s:colorscheme = 'everforest'
endif

execute 'colorscheme' s:colorscheme
let g:lightline_colorscheme = s:colorscheme
" let g:lightline_colorscheme = 'gruvbox_material'
