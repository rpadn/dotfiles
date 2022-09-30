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
" Look and feel ---------------------------------------------------------------
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
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

" Enable folding
"set foldmethod=indent
"set foldlevel=99

" Map leader key to comma
nnoremap <SPACE> <Nop>
let mapleader = " "

" Enable folding with the spacebar
"nnoremap <Leader>w za

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
set listchars+=space:␣

" Persistent undo, even if you close and reopen Vim
"set undodir=~/.vim/undo-dir/
"set undofile

" faster esc
inoremap jj <esc>

" Quick commands
noremap <leader>w :w<CR>
noremap <leader>q :q<CR>
"noremap <Leader>E :qa!<CR>  " Quit all windows
nnoremap <leader>c :bd<CR> " Unload current buffer
nnoremap <leader>C :bd!<CR> " Force unload current buffer

" Close all buffers but current
map <leader>o :%bd\|e#<cr>

" Quickly open a buffer for scribble
map <leader>e :e ~/.vim/tmp/buffer<cr>

" Easier moving between tabs
map <Leader>, <Esc>:bprev<CR>
map <Leader>. <Esc>:bnext<CR>

" Map sort function to a key
vnoremap <Leader>S :sort<CR>

" Easier moving of code blocks
vnoremap < <gv " Better indentation
vnoremap > >gv " Better indentation

" Showing line numbers and length
set number " Show line numbers
set tw=79  " Width of document (used by gd)
set nowrap " Don't automatically wrap on load
set fo-=t  " Don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=2
set cursorline " Highlight current line
"noremap <Leader>l :set invnumber<CR>

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable backup and swap files, they trigger too many events for watchers
set nobackup
set nowritebackup
set noswapfile


" Toggle paste mode on an off, specially for pasting code lines
nnoremap <leader>pp :set invpaste<CR>

" Toggle invisible characters
set listchars=tab:»\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" Copy path of current buffer to system clipboard
nmap <leader>p :let @+=expand('%:p')<CR>

" Execute current line in zsh replacing it
nnoremap <leader>x !!zsh<CR>

" netrw uses rmdir by default
let g:netrw_localrmdir='rm -rf'

" Per-project settings
silent! so .vimlocal

" =============================================================================
" Plugin settings
" =============================================================================
" vim-airline -----------------------------------------------------------------
let g:airline_powerline_fonts = 0
let g:airline_theme='dark'
set laststatus=2

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader><tab> <Plug>AirlineSelectPrevTab
nmap <leader><shift><tab> <Plug>AirlineSelectNextTab

" Papercolor-theme ------------------------------------------------------------
set background=dark
colorscheme PaperColor
"colorscheme monokai

" vim-jedi --------------------------------------------------------------------
let g:jedi#popup_on_dot = 0
let g:jedi#usages_command = "<leader>u"
" conflicts with <leader>s
let g:jedi#goto_stubs_command = ""

" tagbar ----------------------------------------------------------------------
nmap <leader>T :TagbarToggle<CR>
let g:tagbar_type_yaml = {
    \ 'ctagstype' : 'yaml',
    \ 'kinds' : [
        \ 'a:anchors',
        \ 's:section',
        \ 'e:entry'
    \ ],
  \ 'sro' : '.',
    \ 'scope2kind': {
      \ 'section': 's',
      \ 'entry': 'e'
    \ },
    \ 'kind2scope': {
      \ 's': 'section',
      \ 'e': 'entry'
    \ },
    \ 'sort' : 0
    \ }

" vim-fugitive/vim-rhubarb ----------------------------------------------------
" github enterprise for GBrowse
let g:github_enterprise_urls = ['https://github.ps.thmulti.com']

" vim-gutentags --------------------------------------------------------------
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['environment.yaml', '.git']

" ALE -------------------------------------------------------------------------
"let g:ale_python_flake8_executable = 'python3'
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
" let g:ale_linters = {
" \   'python': ['flake8', 'mypy'],
" \}
let g:ale_linters = {
\   'python': ['flake8'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\}

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
nnoremap <leader>m :Marks<CR>
nnoremap <leader>hh :History<CR>
" Search content and not filename (https://github.com/junegunn/fzf.vim/issues/346)
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
nnoremap <leader>s :Ag <CR>
nnoremap <leader>S :Ag <C-R><C-W><CR>

" vim-repl --------------------------------------------------------------------
nnoremap <leader>It :REPLToggle<Cr>
let g:sendtorepl_invoke_key = "<leader>Ii"

" quick-scope -----------------------------------------------------------------
highlight QuickScopePrimary guifg='#ffff00' gui=underline ctermfg=226 cterm=underline
highlight QuickScopeSecondary guifg='#ff5fff' gui=underline ctermfg=207 cterm=underline
