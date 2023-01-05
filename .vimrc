call plug#begin()

" Search ----------------------------------------------------------------------
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" Git -------------------------------------------------------------------------
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'
" Misc ------------------------------------------------------------------------
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
Plug 'thaerkh/vim-workspace'
Plug 'tpope/vim-projectionist'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'unblevable/quick-scope'
Plug 'milkypostman/vim-togglelist'
" Look and feel ---------------------------------------------------------------
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'maximbaz/lightline-ale'
Plug 'sickill/vim-monokai'
Plug 'NLKNguyen/papercolor-theme'
" Dev -------------------------------------------------------------------------
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
" Plug 'ludovicchabant/vim-gutentags'
" Testing ---------------------------------------------------------------------
Plug 'vim-test/vim-test'
Plug 'tpope/vim-dispatch'
" REST ------------------------------------------------------------------------
Plug 'diepm/vim-rest-console'

" LSP -------------------------------------------------------------------------
Plug 'dense-analysis/ale'
" python ----------------------------------------------------------------------
Plug 'vim-scripts/indentpython.vim'
Plug 'sillybun/vim-repl'
" go --------------------------------------------------------------------------
Plug 'fatih/vim-go'

call plug#end()

" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

" Settings
" Set enconding properly
set encoding=utf-8

" System clipboard available
set clipboard=unnamed

" List all characters
set listchars=tab:»\ ,eol:¬,trail:⋅,extends:❯,precedes:❮,space:␣
set showbreak=↪

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
" Make backspace work as normal again
set bs=2

" Mappings
" Map leader key to comma
nmap <SPACE> <Nop>
let mapleader = " "

" Split navigations
nmap <C-j> <C-w><C-j>
nmap <C-k> <C-w><C-k>
nmap <C-l> <C-w><C-l>
nmap <C-h> <C-w><C-h>

" split vertically
nmap <leader>V :vsplit<CR>
" split horizontally
nmap <leader>H :split<CR>

" Removes highlight of last search
nmap <Leader><space> :nohl<CR>

" New empty buffer
nmap <leader>bn :enew<CR>
" Convert whole indentation to tabs
map <Leader>tt :set ts=4 noet <bar> retab!<CR>
" Convert whole indentation to spaces
map <Leader>tT :set ts=4 et <bar> retab!<CR>
" faster esc
imap jj <esc>

" Quick commands
noremap <leader>w :w<CR>
nmap <leader>c :bd<CR> " Unload current buffer
nmap <leader>C :bd!<CR> " Force unload current buffer

" Close all buffers but current
map <leader>o :%bd\|e#<cr>

" Quickly open a buffer for scribble
map <leader>e :vnew<cr>

" Easier moving between tabs
map <Leader>, <Esc>:bprev<CR>
map <Leader>. <Esc>:bnext<CR>

" Easier moving of code blocks
vmap < <gv " Better indentation
vmap > >gv " Better indentation


" .vimlocal support
au BufNewFile,BufRead *.vimlocal setf vim

" =============================================================================
" Plugin settings
" =============================================================================
" Papercolor-theme ------------------------------------------------------------
set background=dark
colorscheme PaperColor

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

" ALE -------------------------------------------------------------------------
let g:ale_lint_on_text_changed = 1
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%severity%] %s'
let g:ale_floating_preview = 1
let g:ale_completion_symbols = {
\  'text': 'text',
\  'method': 'method',
\  'function': 'function',
\  'constructor': 'constructor',
\  'field': 'field',
\  'variable': 'variable',
\  'class': 'class',
\  'interface': 'interface',
\  'module': 'module',
\  'property': 'property',
\  'unit': 'unit',
\  'value': 'value',
\  'enum': 'enum',
\  'keyword': 'keyword',
\  'snippet': 'snippet',
\  'color': 'color',
\  'file': 'file',
\  'reference': 'reference',
\  'folder': 'folder',
\  'enum_member': 'enum member',
\  'constant': 'constant',
\  'struct': 'struct',
\  'event': 'event',
\  'operator': 'operator',
\  'type_parameter': 'type param',
\  '<default>': 'default'
\}

" autocomplete
let g:ale_completion_enabled = 1
" enable popup over split window for inline docs
set completeopt=menu,menuone,popup,noselect,noinsert
set omnifunc=ale#completion#OmniFunc

" mappings
nmap gd <Plug>(ale_go_to_definition)
nmap gD <Plug>(ale_go_to_definition_in_vsplit)
nmap <leader>rn <Plug>(ale_rename)
nmap <leader>rf <Plug>(ale_filerename)
nmap <leader>ra :ALECodeAction<CR>
vmap <leader>ra :ALECodeAction<CR>
nmap <leader>fr :ALEFindReferences -relative -quickfix<CR>
" diagnostic
nmap K <Plug>(ale_hover)
nmap <leader>E <Plug>(ale_detail)
nmap <leader>p <Plug>(ale_previous_wrap)
nmap <leader>n <Plug>(ale_next_wrap)

" Ctrl-Space for completions. Heck Yeah!
imap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" vim-workspace ---------------------------------------------------------------
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_undodir = '.undodir'
let g:workspace_create_new_tabs = 0

" vim-dispatch ----------------------------------------------------------------
nmap <leader>di :Dispatch<Space>

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

" Find files
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore="*.git/" -g ""'
nmap <leader>ff :Files<CR>
" Find opened buffers
nmap <leader>fb :Buffers<CR>
" Files history
nmap <leader>fh :History<CR>

" Search content and not filename (https://github.com/junegunn/fzf.vim/issues/346)
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
nmap <leader>ss :Ag <CR>
" Search selected under cursor
nmap <leader>S :Ag <C-R><C-W><CR>
" Search in current buffer
nmap <leader>sl :BLines<CR>
" Search opened windows
nmap <leader>sw :Windows<CR>
" Search tags in current buffer
nmap <leader>st :BTags<CR>
" Search history
nmap <leader>sh :History/<CR>
" Search commits
nmap <leader>sc :Commits<CR>

" vim-repl --------------------------------------------------------------------
nmap <leader>R :REPLToggle<Cr>
let g:sendtorepl_invoke_key = "<leader>rp"

" quick-scope -----------------------------------------------------------------
highlight QuickScopePrimary guifg='#ffff00' gui=underline ctermfg=226 cterm=underline
highlight QuickScopeSecondary guifg='#ff5fff' gui=underline ctermfg=207 cterm=underline

" fugitive --------------------------------------------------------------------
nmap <leader>gs :Git<CR>
nmap <leader>gg :Git<Space>
nmap <leader>gb :Git blame<CR>
nmap <leader>gl :Git pull<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>go :Git log --oneline<CR>


" Per-project settings
silent! so .vimlocal
