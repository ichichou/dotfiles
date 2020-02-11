if empty(globpath(&runtimepath, 'plugged/memolist.vim'))
    finish
endif

let g:memolist_path = "$HOME/Box/Memos"
let g:memolist_template_dir_path = "$HOME/dotfiles/memolist"
let g:memolist_memo_suffix = "md"
let g:memolist_memo_date = "%Y-%m-%d %H:%M"

nnoremap <silent> <Leader>mn :<C-u>MemoNew<CR>
nnoremap <silent> <Leader>ml :<C-u>MemoList<CR>
" nnoremap <silent> <Leader>mg :<C-u>MemoGrep<CR>
nnoremap <silent> <Leader>mg :execute "FZF" g:memolist_path<CR>
