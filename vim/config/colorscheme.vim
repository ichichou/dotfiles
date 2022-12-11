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

" Edge
let g:edge_style = 'default'
let g:edge_better_performance = 1

" Gruvbox-Material
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_foreground = 'material'
let g:gruvbox_material_better_performance = 1

" Fix highlight
augroup vimrc
    autocmd VimEnter,ColorScheme * highlight! link htmlItalic LineNr
    autocmd VimEnter,ColorScheme * highlight! link htmlBold WarningMsg
    autocmd VimEnter,ColorScheme * highlight! link htmlBoldItalic ErrorMsg
    autocmd VimEnter,ColorScheme * highlight! link HighlightedyankRegion Visual
    autocmd VimEnter,ColorScheme * highlight! link ExtraWhitespace IncSearch

    " if !hlexists('debugBreakpoint')
    "     autocmd VimEnter,ColorScheme * highlight default debugBreakpoint ctermbg=DarkRed guibg=DarkRed
    " endif
    " autocmd VimEnter,ColorScheme * highlight! link ExtraWhitespace debugBreakpoint
augroup END

" Colorscheme
set background=dark
let s:colorscheme = 'everforest'

execute 'colorscheme' s:colorscheme
let g:lightline_colorscheme = s:colorscheme
