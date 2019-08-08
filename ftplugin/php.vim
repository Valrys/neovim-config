"""""""""""""""""""""""""""
"     Settings of plugins
"""""""""""""""""""""""""""

" Refactor code (vim-php/vim-php-refactoring)
let g:php_refactor_command = 'php ~/.local/bin/refactor'

" Display syntax errors (w0rp/ale)
let g:ale_php_phpcs_options = '--standard=~/.phpcs.xml'
let g:ale_echo_msg_format = '[%severity%] %s [%linter%]'
let g:ale_open_list = 1
let g:ale_fixers = {
\   'php': ['php_cs_fixer'],
\}
let g:ale_fix_on_save = 1


""""""""""""""""""""""""""""
"     Settings
""""""""""""""""""""""""""""

let php_sql_query     = 1 " Coloration SQL query
let php_htmlInStrings = 1 " Coloration HTML tags

" Insert missing use > arnaud-lb/vim-php-namespace
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
autocmd FileType php inoremap <Leader>s <Esc>:call PhpSortUse()<CR>
autocmd FileType php noremap <Leader>s :call PhpSortUse()<CR>
let g:php_namespace_sort_after_insert = 1

vnoremap <leader>v :call PHPExtractVariable()<cr>

function! PHPExtractVariable()
    let l:name = input("Name of new variable: $")
    normal! gvx
    execute "normal! i$".l:name
    execute "normal! O$".l:name." = "
    normal! pa;
endfunction
