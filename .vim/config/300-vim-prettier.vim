if !executable("prettier")
    finish
endif

if empty(globpath(&runtimepath, 'autoload/vim-prettier'))
    finish
endif

let g:prettier#exec_cmd_path = "/usr/local/bin/prettier"
let g:prettier#autoformat = 0
" let g:prettier#quickfix_enabled = 0
let g:prettier#quickfix_auto_focus = 0
" let g:prettier#exec_cmd_async = 1
