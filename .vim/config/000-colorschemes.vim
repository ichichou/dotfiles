" ========================================
" Colorschemes
" ========================================

" iceberg hybrid hybrid_material nord tender
if has('gui_running')
    colorscheme hybrid_material
else
    colorscheme iceberg
endif

" hybrid
" ----------
let g:hybrid_custom_term_colors = 1
" let g:lightline_hybrid_style = 'plain'

" hybrid material
" ----------
let g:enable_bold_font = 1
let g:enable_italic_font = 1
" let g:hybrid_transparent_background = 1

" nord
" ----------
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_uniform_status_lines = 1
let g:nord_comment_brightness = 15
let g:nord_uniform_diff_background = 1
let g:nord_cursor_line_number_background = 1
