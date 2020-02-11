if empty(globpath(&runtimepath, 'plugged/previm'))
    finish
endif

let g:previm_open_cmd = 'open -a Google\ Chrome'
" let g:previm_disable_default_css = 1
" let g:previm_custom_css_path = ''
" let g:previm_show_header = 0

nnoremap <silent> <Leader>p :<C-u>PrevimOpen<CR>
