set nocompatible                               " Delete compatibility with Vi and required for Vundle

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd!
    autocmd VimEnter * PlugInstall
endif


" Initialize Vundle
call plug#begin('~/.config/nvim/plugged')


"""""""""""""""""""""""""""
"     List of plugins
"""""""""""""""""""""""""""

Plug 'scrooloose/nerdtree'                     " List files bar
    autocmd vimenter * NERDTree
    let g:nerdtree_tabs_open_on_console_startup=1
    let g:NERDTreeWinSize=40
    map <C-d> :NERDTreeToggle<CR>
Plug 'jistr/vim-nerdtree-tabs'                 " List files bar with tabs
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Color NERDTree
    let s:blue = "689FB6"
    let s:darkBlue = "44788E"
    let s:lightPurple = "834F79"
    let s:red = "AE403F"
    let s:green = "8FAA54"
    let g:NERDTreeFileExtensionHighlightFullName = 1
    let g:NERDTreeHighlightFoldersFullName = 1
    let g:NERDTreeExactMatchHighlightFullName = 1
    let g:NERDTreePatternMatchHighlightFullName = 1
    let g:NERDTreeExtensionHighlightColor = {}
    let g:NERDTreeExtensionHighlightColor['css'] = s:darkBlue
    let g:NERDTreeExtensionHighlightColor['scss'] = s:darkBlue
    let g:NERDTreeExtensionHighlightColor['php'] = s:green
    let g:NERDTreeExtensionHighlightColor['js'] = s:blue
    let g:NERDTreeExtensionHighlightColor['twig'] = s:lightPurple
    let g:NERDTreeExactMatchHighlightColor = {}
    let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:red
    let NERDTreeHighlightCursorline = 0
Plug 'ryanoasis/vim-devicons'
Plug 'Numkil/ag.nvim'                          " Search string
"Plug 'ctrlpvim/ctrlp.vim'                      " Search files recursively
    "let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn|))|node_modules|vendor|cache$'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"nnoremap <silent> <C-p> :call fzf#run({'sink': 'tabedit', 'options': '--multi --preview 'cat {}'})<CR>
Plug 'w0rp/ale'                                " Display syntax errors
    let g:ale_sign_column_always = 1
    let g:ale_sign_error = '✗'
    let g:ale_sign_warning = '⚠'
    let g:airline#extensions#ale#enabled = 1
    let g:ale_lint_on_enter = 0
    let g:ale_open_list = 0
    let g:ale_keep_list_window_open=0
    let g:ale_set_quickfix=0
    let g:ale_lint_on_text_changed = 'never'
    nmap <silent> <C-s> <Plug>(ale_previous_wrap)
    nmap <silent> <C-m> <Plug>(ale_next_wrap)
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocompletion
Plug 'padawan-php/deoplete-padawan', { 'do': 'composer install' }
    let g:deoplete#enable_at_startup = 1
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
Plug 'majutsushi/tagbar'                       " Tag bar
    autocmd VimEnter * nested :TagbarOpen
    let g:tagbar_tabs_open_on_console_startup = 1
	autocmd BufEnter * nested :call tagbar#autoopen(0)
    nmap <C-g> :TagbarToggle<CR>
Plug 'SirVer/ultisnips'                        " Snippets
    let g:UltiSnipsExpandTrigger       = "<c-x>"
    let g:UltiSnipsEditSplit           = "vertical"
    let g:snips_author                 = "Valrys <valrys@pm.me>"
    let g:ultisnips_php_scalar_types   = 1
Plug 'mattn/emmet-vim'                         " Expanding abbreviation
    let g:user_emmet_leader_key = '<C-A>'
Plug 'tpope/vim-fugitive'                      " Git wrapper
Plug 'airblade/vim-gitgutter'                  " Display edited lines with Git
Plug 'terryma/vim-multiple-cursors'            " Multiple selections
Plug 'tpope/vim-surround'                      " Surroundings brackets, parentheses,..
Plug 'godlygeek/tabular'                       " Indentation (recommended for vim-markdown)
    noremap T :Tabularize /
Plug 'vim-airline/vim-airline'                 " Color and style bar
    let g:airline_powerline_fonts = 1
Plug 'vim-airline/vim-airline-themes'          " Color and style bar (themes)
    let g:airline_theme                         = 'solarized_flood'
    let g:airline#extensions#whitespace#enabled = 0
Plug 'ap/vim-css-color'                        " Colorize color code
Plug 'vim-scripts/loremipsum'                  " Display loremipsum text
Plug 'Raimondi/delimitMate'                    " Autoclose brackets
    let g:delimitMate_autoclose  = 1
    let g:delimitMate_expand_cr  = 1
    let g:delimitMate_matchpairs = "(:),[:],{:}"
Plug 'bronson/vim-trailing-whitespace'         " Display useless whitespace
Plug 'Yggdroot/indentLine'                     " Display indent line vertically
    let g:indentLine_enabled = 1
    let g:indentLine_char_list = ['▏']
Plug 'xolox/vim-misc'
Plug 'xolox/vim-shell'                         " Open link in vim with <F6>
Plug 'scrooloose/nerdcommenter'                " Comments
Plug 'adelarsq/vim-matchit'                    " Matching
Plug 'vim-scripts/nextval'
Plug 'sheerun/vim-polyglot'                    " Syntax langagues pack
Plug 'craigemery/vim-autotag'                  " Add/delete tags
    let g:autotagTagsFile=".git/tags"
    autocmd BufWritePost *
      \ if filereadable('tags') |
      \   call system('ctags --options="~/.ctags.cnf" .') |
      \ endif
Plug 'emmanuelgrognet/vim-phpcsfixer'
Plug 'tpope/vim-dispatch'

" CSV plugin
Plug 'chrisbra/csv.vim'                        " Stylisation for CSV files

" PHP plugin
Plug 'rayburgemeestre/phpfolding.vim'          " Fold PHP code
Plug 'vim-php/vim-php-refactoring'             " Refactor PHP code
Plug 'arnaud-lb/vim-php-namespace'             " Insert missing use with <Leader>u
Plug 'alvan/vim-php-manual'                    " Open manual PHP on browser
    let g:php_manual_online_search_shortcut = '<Leader>m'

" Twig plugin
Plug 'lumiliet/vim-twig'                       " Twig syntax

" Latex plugin
Plug 'donRaphaco/neotex'                       " Preview PDF

call plug#end()

syntax on                                      " Enable syntax color

let mapleader      = ","  " Define map leader key
let maplocalleader = "\\" " Define map leader local key

set shell=bash            " Set shell


""""""""""""""""""""""""""""
"     Editing behaviour
""""""""""""""""""""""""""""

set cursorcolumn     " Highlight cursor column
set cursorline       " Highlight cursor line
set ignorecase       " Ignore case sensitivity when searching
set hidden           " Hide files during open others files
set noerrorbells     " Disable beep
set nolist           " Hide invisible character by default
set novisualbell     " Disable beep
set number           " Number of cursor position
set scrolloff=4      " Keep 4 lines when scrolling down
set shiftwidth=4     " Number of spaces for autoindenting
set showmatch        " Show matching parenthesis
set smartcase        " Ignore case if search contains all lowercase
set tabstop=4        " Four spaces for tab
set title            " Change shell's title"
set pastetoggle=<F2> " Go to paste mode


""""""""""""""""""""""""""""
"     Custom key
""""""""""""""""""""""""""""

" Uppercase the word under cursor
nnoremap <C-u> viwUe
" Lowercase the word under cursor
nnoremap <C-y> viwue

" Disable arrow navigation
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Open and close fold
map <s-tab> :foldclose<cr>
map <tab> :foldopen<cr>

" Center search pattern
nnoremap n nzz
nnoremap N Nzz

" Switch between normal and insert mode
inoremap ,, <Esc>

" Switch between windows
"noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h


""""""""""""""""""""""""""""
"     Settings
""""""""""""""""""""""""""""
colorscheme hybrid             					" Theme
filetype on                    					" Enable all files type
filetype plugin on             					" Enable plugins for all files type
filetype indent on             					" Enable indenting for all files type
au filetype * setl et ts=4 sw=4					" Define spaces and tabulations for files
autocmd BufReadPre,FileReadPre *.php set ft=php " Define PHP file

hi CursorLine cterm=NONE ctermfg=NONE
hi CursorColumn cterm=NONE ctermfg=NONE

" Delete automatically whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Disable arrow movement, resize splits instead.
nnoremap <c-Up>    :resize +2<CR>
nnoremap <c-Down>  :resize -2<CR>
nnoremap <c-Left>  :vertical resize +2<CR>
nnoremap <c-Right> :vertical resize -2<CR>

if has('nvim') || has('gui_running')
	let $FZF_DEFAULT_OPTS .= ' --inline-info'
	let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Reselect block after indentation
vnoremap < <gv
vnoremap > >gv

" Deselect word
nmap <Leader><Space> :nohl<cr>

" FZF
" All files
command! -nargs=? -complete=dir AF
			\ call fzf#run(fzf#wrap(fzf#vim#with_preview({
			\   'source': 'fd --type f --hidden --follow --exclude .git --no-ignore . '.expand(<q-args>)
			\ })))

" Hide statusline of terminal buffer
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
			\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:fzf_colors =
			\ { 'fg':      ['fg', 'Normal'],
			\ 'bg':      ['bg', 'Normal'],
			\ 'hl':      ['fg', 'Comment'],
			\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
			\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
			\ 'hl+':     ['fg', 'Statement'],
			\ 'info':    ['fg', 'PreProc'],
			\ 'border':  ['fg', 'Ignore'],
			\ 'prompt':  ['fg', 'Conditional'],
			\ 'pointer': ['fg', 'Exception'],
			\ 'marker':  ['fg', 'Keyword'],
			\ 'spinner': ['fg', 'Label'],
			\ 'header':  ['fg', 'Comment'] }

command! -bang -nargs=? -complete=dir Files
			\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" nnoremap <silent> <Leader><Leader> :Files<CR>
nnoremap <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader>C        :Colors<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>L        :Lines<CR>
command! -bang -nargs=* Ag
			\ call fzf#vim#ag(<q-args>,
			\                 <bang>0 ? fzf#vim#with_preview('up:60%')
			\                         : fzf#vim#with_preview('right:50%:hidden', '?'),
			\                 <bang>0)
nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
xnoremap <silent> <Leader>ag       y:Ag <C-R>"<CR>
nnoremap <silent> <Leader>`        :Marks<CR>
" nnoremap <silent> q: :History:<CR>
" nnoremap <silent> q/ :History/<CR>

inoremap <expr> <c-x><c-t> fzf#complete('tmuxwords.rb --all-but-current --scroll 500 --min 5')
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
inoremap <expr> <c-x><c-d> fzf#vim#complete#path('blsd')
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" nmap <leader><tab> <plug>(fzf-maps-n)
" xmap <leader><tab> <plug>(fzf-maps-x)
" omap <leader><tab> <plug>(fzf-maps-o)

function! s:plug_help_sink(line)
	let dir = g:plugs[a:line].dir
	for pat in ['doc/*.txt', 'README.md']
		let match = get(split(globpath(dir, pat), "\n"), 0, '')
		if len(match)
			execute 'tabedit' match
			return
		endif
	endfor
	tabnew
	execute 'Explore' dir
endfunction

command! PlugHelp call fzf#run(fzf#wrap({
			\ 'source': sort(keys(g:plugs)),
			\ 'sink':   function('s:plug_help_sink')}))
