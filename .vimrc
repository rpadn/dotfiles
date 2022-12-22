set nocompatible  " Required
filetype off      " Required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" search ----------------------------------------------------------------------
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" git -------------------------------------------------------------------------
Plugin 'tpope/vim-fugitive'
Plugin 'rbong/vim-flog'
Plugin 'airblade/vim-gitgutter'
Plugin 'shumphrey/fugitive-gitlab.vim'
" misc ------------------------------------------------------------------------
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-vinegar'
Plugin 'thaerkh/vim-workspace'
Plugin 'tpope/vim-projectionist'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'unblevable/quick-scope'
Plugin 'milkypostman/vim-togglelist'
" Look and feel ---------------------------------------------------------------
Plugin 'itchyny/lightline.vim'
Plugin 'mengelbrecht/lightline-bufferline'
Plugin 'maximbaz/lightline-ale'
Plugin 'sickill/vim-monokai'
Plugin 'NLKNguyen/papercolor-theme'
" dev -------------------------------------------------------------------------
Plugin 'cespare/vim-toml'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-commentary'
" test ------------------------------------------------------------------------
Plugin 'vim-test/vim-test'
Plugin 'tpope/vim-dispatch'
" python ----------------------------------------------------------------------
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'davidhalter/jedi-vim'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'dense-analysis/ale'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'vim-python/python-syntax'
Plugin 'sillybun/vim-repl'
" go --------------------------------------------------------------------------
Plugin 'fatih/vim-go'
" REST ------------------------------------------------------------------------
Plugin 'diepm/vim-rest-console'

" All of your Plugins must be added before the following line
call vundle#end()          " Required
filetype plugin indent on  " Required

" Split navigations
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Map leader key to comma
nnoremap <SPACE> <Nop>
let mapleader = " "

" split vertically
nnoremap <leader>V :vsplit<CR>
" split horizontally
nnoremap <leader>H :split<CR>

" Removes highlight of last search
nnoremap <Leader><space> :nohl<CR>

" New empty buffer
nnoremap <leader>b :enew<CR>

" Make backspace work as normal again
set bs=2

" Proper PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=88 |
    \ set colorcolumn=88 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" go
au BufNewFile,BufRead *.go
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=80 |
    \ set colorcolumn=80 |
    \ set autoindent |
    \ set fileformat=unix

" Full-stack development indentation
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" yaml files
au BufNewFile,BufRead *.yaml
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" jenkinsfile
au BufNewFile,BufRead *.groovy,Jenkinsfile setf groovy

" Convert whole indentation to tabs
map <Leader>tt :set ts=4 noet <bar> retab!<CR>
" Convert whole indentation to spaces
map <Leader>tT :set ts=4 et <bar> retab!<CR>

" Flagging unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Set enconding properly
set encoding=utf-8

" Make code look pretty!
let python_highlight_all=1
syntax enable

" System clipboard available
set clipboard=unnamed

" List all characters
set listchars=tab:»\ ,eol:¬,trail:⋅,extends:❯,precedes:❮,space:␣
set showbreak=↪

" faster esc
inoremap jj <esc>

" Quick commands
noremap <leader>w :w<CR>
nnoremap <leader>c :bd<CR> " Unload current buffer
nnoremap <leader>C :bd!<CR> " Force unload current buffer

" Close all buffers but current
map <leader>o :%bd\|e#<cr>

" Quickly open a buffer for scribble
map <leader>e :vnew<cr>

" Easier moving between tabs
map <Leader>, <Esc>:bprev<CR>
map <Leader>. <Esc>:bnext<CR>

" Easier moving of code blocks
vnoremap < <gv " Better indentation
vnoremap > >gv " Better indentation

set number " Show line numbers
set tw=79  " Width of document (used by gd)
set colorcolumn=80
highlight ColorColumn ctermbg=2
set cursorline " Highlight current line
set mouse=a
set nowrap " Don't automatically wrap on load
set fo-=t  " Don't automatically wrap text when typing

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable backup and swap files, they trigger too many events for watchers
set nobackup
set nowritebackup
set noswapfile

" netrw uses rmdir by default
let g:netrw_localrmdir='rm -rf'

" Per-project settings
silent! so .vimlocal

" =============================================================================
" Plugin settings
" =============================================================================

" lightline -------------------------------------------------------------------
set laststatus=2
set showtabline=2
let g:lightline = {
    \ 'colorscheme': 'one',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \               [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
    \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
    \              [ 'lineinfo' ],
    \              [ 'percent' ],
    \              [ 'fileformat', 'fileencoding', 'filetype'] ]
    \ },
    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
    \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
    \ 'tabline': {
    \   'left': [ ['buffers'] ],
    \   'right': [ [ 'close' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ 'component_expand': {
    \   'buffers': 'lightline#bufferline#buffers',
    \   'linter_checking': 'lightline#ale#checking',
    \   'linter_infos': 'lightline#ale#infos',
    \   'linter_warnings': 'lightline#ale#warnings',
    \   'linter_errors': 'lightline#ale#errors',
    \   'linter_ok': 'lightline#ale#ok'
    \ },
    \ 'component_type': {
    \   'buffers': 'tabsel',
    \   'linter_checking': 'right',
    \   'linter_infos': 'right',
    \   'linter_warnings': 'warning',
    \   'linter_errors': 'error',
    \   'linter_ok': 'right',
    \ },
    \ }

let g:lightline#ale#indicator_checking = "\uf110"
" space after the icone as the font icon overlaps with the number
let g:lightline#ale#indicator_infos = "\uf129 "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c"

" Papercolor-theme ------------------------------------------------------------
set background=dark
colorscheme PaperColor

" vim-jedi --------------------------------------------------------------------
let g:jedi#usages_command = "<leader>u"
" conflicts with <leader>s
let g:jedi#goto_stubs_command = ""
let g:jedi#smart_auto_mapping = 1
let g:jedi#use_splits_not_buffers = "right"

" vim-gutentags --------------------------------------------------------------
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['environment.yaml', '.git']

" ALE -------------------------------------------------------------------------
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'
let g:ale_linters = {
\   'python': ['flake8', 'mypy'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\}

nmap <script> <silent> <leader>q :call ToggleQuickfixList()<CR>

nmap <F8> <Plug>(ale_fix)
nmap <leader>N <Plug>(ale_previous_wrap)
nmap <leader>n <Plug>(ale_next_wrap)

" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

" vim-workspace ---------------------------------------------------------------
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_undodir = '.undodir'
let g:workspace_create_new_tabs = 0

" vim-test --------------------------------------------------------------------
let test#strategy = 'dispatch'
let test#python#runner = 'pytest'
nmap <leader>tn :TestNearest<CR>
nmap <leader>tf :TestFile<CR>
nmap <leader>tt :TestSuite<CR>
nmap <leader>tl :TestLast<CR>
nmap <leader>tv :TestVisit<CR>

" fzf.vim ---------------------------------------------------------------------
let g:fzf_history_dir = '~/.local/share/fzf-history'

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore="*.git/" -g ""'
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fl :BLines<CR>
nnoremap <leader>ft :BTags<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>ta :Tags<CR>
nnoremap <leader>hh :History<CR>
" Search content and not filename (https://github.com/junegunn/fzf.vim/issues/346)
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
nnoremap <leader>s :Ag <CR>
nnoremap <leader>S :Ag <C-R><C-W><CR>

" vim-repl --------------------------------------------------------------------
nnoremap <leader>P :REPLToggle<Cr>
let g:sendtorepl_invoke_key = "p"


" quick-scope -----------------------------------------------------------------
highlight QuickScopePrimary guifg='#ffff00' gui=underline ctermfg=226 cterm=underline
highlight QuickScopeSecondary guifg='#ff5fff' gui=underline ctermfg=207 cterm=underline

" fugitive --------------------------------------------------------------------
nnoremap <leader>gl :Git log --oneline<CR>
