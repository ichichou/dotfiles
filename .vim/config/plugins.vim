" ----------------------------------------
" Plugins
" ----------------------------------------

let g:hybrid_custom_term_colors = 1
" let g:lightline_hybrid_style = 'plain'

let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_uniform_status_lines = 1
let g:nord_comment_brightness = 15
let g:nord_uniform_diff_background = 1
let g:nord_cursor_line_number_background = 1

" lightline
" --------------------
" powerline wombat jellybeans solarized PaperColor seoul256 Dracula one landscape
" hybrid iceberg tender tenderplus nord

if has('gui_running')
    let g:lightline = {
        \ 'colorscheme': 'iceberg',
        \ 'active': {
            \ 'left': [
                \ ['mode', 'paste'],
                \ ['readonly', 'filepath', 'modified']],
            \ 'right': [
                \ ['lineinfo'],
                \ ['percent'],
                \ ['fileformat', 'fileencoding', 'filetype']]},
        \ 'component': {
            \ 'percent': '%3p%% [%LL]'},
        \ 'component_function': {
            \ 'filepath': 'FilePath'}}
else
    let g:lightline = {
        \ 'colorscheme': 'hybrid',
        \ 'active': {
            \ 'left': [
                \ ['mode', 'paste'],
                \ ['readonly', 'filepath', 'modified']],
            \ 'right': [
                \ ['lineinfo'],
                \ ['percent'],
                \ ['fileformat', 'fileencoding', 'filetype']]},
        \ 'component': {
            \ 'percent': '%3p%% [%LL]'},
        \ 'component_function': {
            \ 'filepath': 'FilePath'}}
endif

function! FilePath()
    if winwidth(0) > 70
        return expand('%:s')
    else
        return expand('%:t')
    endif
endfunction

let g:lightline.tabline = {
    \ 'left': [['tabs']],
    \ 'right': [['']],}

" vaffle
" --------------------
let g:vaffle_auto_cd = 1
let g:vaffle_show_hidden_files = 1

nnoremap <silent> <Leader>v :<C-u>Vaffle<CR>

" rcmdnk/vim-markdown
" --------------------
highlight link htmlItalic LineNr
highlight link htmlBold WarningMsg
highlight link htmlBoldItalic ErrorMsg

let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_conceal = 0

" previm
" --------------------
let g:previm_open_cmd = 'open -a Google\ Chrome'
" let g:previm_disable_default_css = 1
" let g:previm_custom_css_path = ''
" let g:previm_show_header = 0

nnoremap <silent> <Leader>p :<C-u>PrevimOpen<CR>

" open-browser
" --------------------
let g:netrw_nogx = 1

map gx <Plug>(openbrowser-smart-search)

" better-whitespace
" --------------------
" let g:better_whitespace_filetypes_blacklist = ['diff', 'gitcommit', 'qf', 'help']
autocmd vimrc FileType diff,gitcommit,qf,help DisableWhitespace

highlight ExtraWhitespace ctermbg=DarkRed
highlight ExtraWhitespace guibg=DarkRed

" jasegment
" --------------------
call jasegment#define(
    \'nonblank', {
        \ 'move-n': 'gW',
        \ 'move-p': 'gB',
        \ 'move-N': 'gE',
        \ 'select-i': 'iE',
        \ 'select-a': 'aE',})

" yankround
" --------------------
let g:yankround_max_history = 100
let g:yankround_use_region_hl = 1

map p <Plug>(yankround-p)
map P <Plug>(yankround-P)
map gp <Plug>(yankround-gp)
map gP <Plug>(yankround-gP)

nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

" vim-easymotion
" --------------------
let g:EasyMotion_do_mapping = 0

let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_migemo = 1

let g:EasyMotion_startofline = 0
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1

let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTASDGZXCVBJF'

map s <Plug>(easymotion-bd-f2)
nmap s <Plug>(easymotion-overwin-f2)
" map f <Plug>(easymotion-bd-fl)
" map F <Plug>(easymotion-bd-fl)

" highlight link EasyMotionTarget ErrorMsg
" highlight link EasyMotionShade Comment
" highlight link EasyMotionTarget2First MatchParen
" highlight link EasyMotionTarget2Second MatchParen
" highlight link EasyMotionMoveHL Search
" highlight link EasyMotionIncSearch Search

" operator-replace
" --------------------
map R <Plug>(operator-replace)

" operator-surround
" --------------------
nnoremap S <Nop>
map S <Plug>(operator-surround-append)
map Sd <Plug>(operator-surround-delete)
map Sr <Plug>(operator-surround-replace)

let g:operator#surround#blocks = {'-' : [
    \ {
        \ 'block': ['**', '**'],
        \ 'motionwise': ['char', 'line', 'block'],
        \ 'keys': ['*']
    \ },
    \ {
        \ 'block': ['（', '）'],
        \ 'motionwise': ['char', 'line', 'block'],
        \ 'keys': ['（', '）', 'm']
    \ },
    \ {
        \ 'block': ['「', '」'],
        \ 'motionwise': ['char', 'line', 'block'],
        \ 'keys': ['「', '」', 'k']
    \ },
    \ {
        \ 'block': ['『', '』'],
        \ 'motionwise': ['char', 'line', 'block'],
        \ 'keys': ['『', '』', 'K']
    \ },
\ ]}

" operator-flashy
" --------------------
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

" memolist
" --------------------
let g:memolist_path = "$HOME/Box/Memos"
let g:memolist_template_dir_path = "$HOME/dotfiles/memolist"
let g:memolist_memo_suffix = "md"
let g:memolist_memo_date = "%Y-%m-%d %H:%M"

nnoremap <silent> <Leader>mn :<C-u>MemoNew<CR>
nnoremap <silent> <Leader>ml :<C-u>MemoList<CR>
" nnoremap <silent> <Leader>mg :<C-u>MemoGrep<CR>
nnoremap <silent> <Leader>mg :execute "FZF" g:memolist_path<CR>

" fzf
" --------------------
let g:fzf_layout = {'down': '~60%'}
let g:fzf_buffers_jump = 1

nnoremap <Leader>f <Nop>
nnoremap [fzf] <Nop>
nmap <Leader>f [fzf]

nnoremap <silent> [fzf]b :<C-u>Buffers<CR>
nnoremap <silent> [fzf]c :<C-u>Colors<CR>
nnoremap <silent> [fzf]f :<C-u>Files<CR>
nnoremap <silent> [fzf]h :<C-u>History<CR>
nnoremap <silent> [fzf]l :<C-u>BLines<CR>
nnoremap <silent> [fzf]m :<C-u>Marks<CR>
nnoremap <silent> [fzf]t :<C-u>Filetypes<CR>
nnoremap [fzf]r :<C-u>Rg<Space>

nnoremap <silent> <Leader>b :<C-u>Buffers<CR>

command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang Colors
\ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\ 'rg --line-number --no-heading --color=auto --smart-case '.shellescape(<q-args>), 0,
\ fzf#vim#with_preview('right:50%:wrap'))

" gitgutter
" --------------------
set updatetime=250

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

nnoremap <Leader>h <Nop>
nnoremap [gitgutter] <Nop>
nmap <Leader>h [gitgutter]

nnoremap <silent> [gitgutter]j :<C-u>GitGutterNextHunk<CR>
nnoremap <silent> [gitgutter]k :<C-u>GitGutterPrevHunk<CR>
nnoremap <silent> [gitgutter]h :<C-u>GitGutterLineHighlightsToggle<CR>
nnoremap <silent> [gitgutter]p :<C-u>GitGutterPreviewHunk<CR>
nnoremap <silent> [gitgutter]s :<C-u>GitGutterStagewHunk<CR>
nnoremap <silent> [gitgutter]u :<C-u>GitGutterUndoHunk<CR>

" fugitive
" --------------------
nnoremap <Leader>g <Nop>
nnoremap [fugitive] <Nop>
nmap <Leader>g [fugitive]

nnoremap <silent> [fugitive]s :<C-u>Gstatus<CR>
nnoremap <silent> [fugitive]a :<C-u>Gwrite<CR>
nnoremap <silent> [fugitive]c :<C-u>Gcommit -v<CR>
nnoremap <silent> [fugitive]d :<C-u>Gvdiffsplit<CR>
nnoremap <silent> [fugitive]l :<C-u>Glog<CR>

autocmd vimrc FileType fugitive nnoremap <silent> <buffer> q <C-w>q

" agit
" --------------------
" let g:agit_enable_auto_show_commit = 0
" let g:agit_enable_auto_refresh = 1

" caw.vim
" --------------------
map <Leader>c <Plug>(caw:hatpos:toggle)
map <Leader>0 <Plug>(caw:zeropos:toggle)

" vim-polyglot
" --------------------
let g:polyglot_disabled = ['markdown', 'csv']

" tabular
" --------------------
function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' &&
    \ (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction
inoremap <silent> <Bar> <Bar><Esc>:call <SID>align()<CR>a

" map <Leader>a= :Tabularize /=<CR>
" map <Leader>a: :Tabularize /:\zs<CR>

" vim-smartinput
" --------------------
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
call smartinput#map_to_trigger('i', '（', '（', '（')
call smartinput#map_to_trigger('i', '「', '「', '「')
call smartinput#map_to_trigger('i', '『', '『', '『')
call smartinput#map_to_trigger('i', '〈', '〈', '〈')
call smartinput#map_to_trigger('i', '【', '【', '【')
call smartinput#map_to_trigger('i', '［', '［', '［')
call smartinput#map_to_trigger('i', '｛', '｛', '｛')
call smartinput#map_to_trigger('i', '）', '）', '）')
call smartinput#map_to_trigger('i', '」', '」', '」')
call smartinput#map_to_trigger('i', '』', '』', '』')
call smartinput#map_to_trigger('i', '〉', '〉', '〉')
call smartinput#map_to_trigger('i', '】', '】', '】')
call smartinput#map_to_trigger('i', '］', '］', '］')
call smartinput#map_to_trigger('i', '｝', '｝', '｝')

call smartinput#define_rule({
    \ 'at': '\s\+\%#',
    \ 'char': '<CR>',
    \ 'input': "<C-o>:call setline('.', substitute(getline('.'), '\\s\\+$', '', ''))<CR><CR>",})

call smartinput#define_rule({'at': '(\%#)', 'char': '<Space>', 'input': '<Space><Space><Left>'})
call smartinput#define_rule({'at': '{\%#}', 'char': '<Space>', 'input': '<Space><Space><Left>'})
call smartinput#define_rule({'at': '\[\%#\]', 'char': '<Space>', 'input': '<Space><Space><Left>'})
call smartinput#define_rule({'at': '<\%#>', 'char': '<Space>', 'input': '<Space><Space><Left>'})

call smartinput#define_rule({'at': '( \%# )', 'char': '<BS>', 'input': '<BS><Del>'})
call smartinput#define_rule({'at': '{ \%# }', 'char': '<BS>', 'input': '<BS><Del>'})
call smartinput#define_rule({'at': '\[ \%# \]', 'char': '<BS>', 'input': '<BS><Del>'})
call smartinput#define_rule({'at': '< \%# >', 'char': '<BS>', 'input': '<BS><Del>'})

call smartinput#define_rule({'at': '\%#', 'char': '（', 'input': '（）<Left>'})
call smartinput#define_rule({'at': '\%#', 'char': '「', 'input': '「」<Left>'})
call smartinput#define_rule({'at': '\%#', 'char': '『', 'input': '『』<Left>'})
call smartinput#define_rule({'at': '\%#', 'char': '〈', 'input': '〈〉<Left>'})
call smartinput#define_rule({'at': '\%#', 'char': '【', 'input': '【】<Left>'})
call smartinput#define_rule({'at': '\%#', 'char': '［', 'input': '［］<Left>'})
call smartinput#define_rule({'at': '\%#', 'char': '｛', 'input': '｛｝<Left>'})

call smartinput#define_rule({'at': '（.*\%#）', 'char': '）', 'input': '<Right>'})
call smartinput#define_rule({'at': '「.*\%#」', 'char': '」', 'input': '<Right>'})
call smartinput#define_rule({'at': '『.*\%#』', 'char': '』', 'input': '<Right>'})
call smartinput#define_rule({'at': '〈.*\%#〉', 'char': '〉', 'input': '<Right>'})
call smartinput#define_rule({'at': '【.*\%#】', 'char': '】', 'input': '<Right>'})
call smartinput#define_rule({'at': '［.*\%#］', 'char': '］', 'input': '<Right>'})
call smartinput#define_rule({'at': '｛.*\%#｝', 'char': '｝', 'input': '<Right>'})

call smartinput#define_rule({'at': '（\%#）', 'char': '<BS>', 'input': '<BS><Del>'})
call smartinput#define_rule({'at': '「\%#」', 'char': '<BS>', 'input': '<BS><Del>'})
call smartinput#define_rule({'at': '『\%#』', 'char': '<BS>', 'input': '<BS><Del>'})
call smartinput#define_rule({'at': '〈\%#〉', 'char': '<BS>', 'input': '<BS><Del>'})
call smartinput#define_rule({'at': '【\%#】', 'char': '<BS>', 'input': '<BS><Del>'})
call smartinput#define_rule({'at': '［\%#］', 'char': '<BS>', 'input': '<BS><Del>'})
call smartinput#define_rule({'at': '｛\%#｝', 'char': '<BS>', 'input': '<BS><Del>'})

call smartinput#define_rule({'at': '（）\%#', 'char': '<BS>', 'input': '<BS><BS>'})
call smartinput#define_rule({'at': '「」\%#', 'char': '<BS>', 'input': '<BS><BS>'})
call smartinput#define_rule({'at': '『』\%#', 'char': '<BS>', 'input': '<BS><BS>'})
call smartinput#define_rule({'at': '〈〉\%#', 'char': '<BS>', 'input': '<BS><BS>'})
call smartinput#define_rule({'at': '【】\%#', 'char': '<BS>', 'input': '<BS><BS>'})
call smartinput#define_rule({'at': '［］\%#', 'char': '<BS>', 'input': '<BS><BS>'})
call smartinput#define_rule({'at': '｛｝\%#', 'char': '<BS>', 'input': '<BS><BS>'})

" vim-closetag
" --------------------
let g:closetag_filetypes = 'html,xhtml,phtml,xml,markdown'

" vim-prettier
" --------------------
let g:prettier#exec_cmd_path = "/usr/local/bin/prettier"
let g:prettier#autoformat = 0
" let g:prettier#quickfix_enabled = 0
let g:prettier#quickfix_auto_focus = 0
" let g:prettier#exec_cmd_async = 1

" ale
" --------------------
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
" let g:ale_lint_on_filetype_changed = 0
" let g:ale_lint_on_save = 0

" let g:ale_sign_column_always = 1
" let g:ale_sign_error = '!'
" g:ale_sign_warning = '?'

" let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_linters = {
    \ 'html': ['htmlhint'],
    \ 'javascript': ['eslint'],
    \ 'python': ['flake8'],}
let g:ale_fixers = {
    \ 'html': ['prettier'],
    \ 'javascript': ['eslint'],
    \ 'python': ['black', 'isort'],}

let g:ale_python_flake8_options = ''
let g:ale_python_black_options = ''

function! s:ale_list()
    let g:ale_open_list = 1
    call ale#Queue(0, 'lint_file')
endfunction
command! ALEList call s:ale_list()

nnoremap <Leader>a <Nop>
nnoremap [ale] <Nop>
nmap <Leader>a [ale]

nmap <silent> [ale]t <Plug>(ale_toggle)
nmap <silent> [ale]f <Plug>(ale_fix)
nnoremap <silent> [ale]l :ALEList<CR>

nmap <silent> [ale]] <Plug>(ale_next)
nmap <silent> [ale][ <Plug>(ale_previous)
nmap ]a <Plug>(ale_next)
nmap [a <Plug>(ale_previous)

augroup vimrc
    autocmd FileType qf nnoremap <silent> <buffer> q :let g:ale_open_list = 0<CR>:q!<CR>
    autocmd FileType help,qf,man,ref let b:ale_enabled = 0
augroup END

" emmet.vim
" --------------------
" let g:user_emmet_leader_key='<C-E>'
let g:user_emmet_install_global = 0
autocmd vimrc FileType html,css,markdown EmmetInstall

" jedi-vim
" --------------------
" let g:jedi#auto_initialization = 0
" let g:jedi#auto_vim_configuration = 0
" let g:jedi#use_tabs_not_buffers = 1
" let g:jedi#use_splits_not_buffers = 'right'
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = 0

autocmd vimrc FileType python setlocal completeopt-=preview

let g:jedi#goto_command = '<leader>jd'
let g:jedi#goto_assignments_command = '<leader>jg'
let g:jedi#goto_definitions_command = ''
let g:jedi#documentation_command = '<Leader>jk'
let g:jedi#usages_command = '<leader>jn'
let g:jedi#completions_command = '<C-n>'
let g:jedi#rename_command = '<leader>jr'

" supertab
" --------------------
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabContextDefaultCompletionType = '<C-n>'

" vim-asterisk
" --------------------
map * <Plug>(asterisk-z*)
map # <Plug>(asterisk-z#)
map g* <Plug>(asterisk-gz*)
map g# <Plug>(asterisk-gz#)

" let g:asterisk#keeppos = 1
