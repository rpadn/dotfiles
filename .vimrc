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
Plug 'tpope/vim-obsession'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'unblevable/quick-scope'
Plug 'milkypostman/vim-togglelist'
Plug 'Asheq/close-buffers.vim'
Plug 'mbbill/undotree'
" Look and feel ---------------------------------------------------------------
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'  " what is this?
Plug 'josa42/vim-lightline-coc'
Plug 'sickill/vim-monokai'
Plug 'NLKNguyen/papercolor-theme'
" Dev -------------------------------------------------------------------------
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" LSP -------------------------------------------------------------------------
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'  " fzf for coc-list
" Testing ---------------------------------------------------------------------
Plug 'vim-test/vim-test'
Plug 'tpope/vim-dispatch'
" REST ------------------------------------------------------------------------
Plug 'diepm/vim-rest-console'
" python ----------------------------------------------------------------------
Plug 'yaegassy/coc-pylsp', {'do': 'yarn install --frozen-lockfile'}
Plug 'vim-scripts/indentpython.vim'
Plug 'sillybun/vim-repl'
" go --------------------------------------------------------------------------
Plug 'fatih/vim-go'
" haskell ---------------------------------------------------------------------
"

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
set formatoptions-=t " Don't automatically wrap text when typing
set scrolloff=20 " Keep cursor more 'centered' when scrolling

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

" Splits ----------------------------------------------------------------------
" navigation
nmap <C-j> <C-w><C-j>
nmap <C-k> <C-w><C-k>
nmap <C-l> <C-w><C-l>
nmap <C-h> <C-w><C-h>
" open netrw in vertical split
nmap <leader>V :Vex<CR>
" open netrw in horizontal split
nmap <leader>H :Sex<CR>

" Buffers ---------------------------------------------------------------------
" new empty buffer in a vsplit
nmap <leader>bn :vnew<CR>
" unload current buffer
nmap <leader>c :bd<CR>
" force unload current buffer
nmap <leader>C :bd!<CR>
" close all buffers but current
map <leader>bo :Bdelete other<CR>
" close all hidden buffers
map <leader>bh :Bdelete hidden<CR>
" close all buffers
map <leader>ba :Bdelete all<CR>
" close buffers selectively
map <leader>bs :Bdelete select<CR>
" easier moving between buffers
map <Leader>, <Esc>:bprev<CR>
map <Leader>. <Esc>:bnext<CR>

" quick save
nmap <leader>w :w<CR>

" yank buffer relative to sys clipboard
nmap <leader>yr :let @+=expand("%")<CR>
" yank buffer absolute path to sys clipboard
nmap <leader>yp :let @+=expand("%:p")<CR>

" Misc ------------------------------------------------------------------------
" removes highlight of last search
nmap <leader><space> :nohl<CR>
" convert whole indentation to tabs
map <leader>tt :set ts=4 noet <bar> retab!<CR>
" convert whole indentation to spaces
map <leader>tT :set ts=4 et <bar> retab!<CR>
" faster esc
imap jj <esc>
" easier moving of code blocks
vmap < <gv
vmap > >gv

" diff files in current windows
nmap <leader>df :windo diffthis<CR>
nmap <leader>dc :diffoff!<CR>
" receive / send visual selection
vmap <leader>dg :diffget<CR>
vmap <leader>dp :diffput<CR>

" try to open markdown in browser
" autocmd BufEnter *.md exe 'nmap <leader>xb :!xdg-open file://%:p<CR>'


" zsh-like completion
set wildmenu
set wildmode=full
set wildoptions=pum

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
    \   'left': [
    \             [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ],
    \             [ 'linter_errors', 'linter_warnings', 'linter_info', 'linter_hints', 'linter_ok' ],
    \           ],
    \   'right': [
    \              ['filetype'],
    \              [ 'fileformat', 'fileencoding'],
    \              [ 'lineinfo' ],
    \              [ 'percent' ],
    \            ]
    \ },
    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
    \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
    \ 'tabline': {
    \   'left': [ ['buffers'] ],
    \   'right': [ [ 'close' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead',
    \ },
    \ 'component_expand': {
    \   'buffers': 'lightline#bufferline#buffers',
    \   'linter_errors': 'lightline#coc#errors',
    \   'linter_warnings': 'lightline#coc#warnings',
    \   'linter_info': 'lightline#coc#info',
    \   'linter_hints': 'lightline#coc#hints',
    \   'linter_ok': 'lightline#coc#ok',
    \ },
    \ 'component_type': {
    \   'buffers': 'tabsel',
    \   'linter_errors': 'error',
    \   'linter_warnings': 'warning',
    \   'linter_info': 'info',
    \   'linter_hints': 'hint',
    \   'linter_ok': 'left',
    \ },
    \ }

let g:lightline#coc#indicator_errors = 'E '
let g:lightline#coc#indicator_warnings = 'W '
let g:lightline#coc#indicator_info = 'I '
let g:lightline#coc#indicator_hints = 'H '

" COC -------------------------------------------------------------------------
set updatetime=300
set signcolumn=yes
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-@> coc#refresh()

" diagnostic
nmap <silent> [n <Plug>(coc-diagnostic-prev)
nmap <silent> ]n <Plug>(coc-diagnostic-next)
" fills the location list the first time is executed
nmap <leader>da :CocDiagnostics<CR>
" show docs (hover)
nmap K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" GoTo code navigation
nmap gd <Plug>(coc-definition)
nmap <silent>gD :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <leader>rn <Plug>(coc-rename)
" code actions
vmap <leader>as <Plug>(coc-codeaction-selected)
nmap <leader>as <Plug>(coc-codeaction-source)
nmap <leader>ac <Plug>(coc-codeaction-cursor)
" refactor
nmap <leader>re <Plug>(coc-codeaction-refactor)
vmap <leader>re <Plug>(coc-codeaction-refactor-selected)

nmap <leader>fm :call CocAction('format')<CR>
nmap <leader>qf <Plug>(coc-fix-current)

" find usages
nmap <leader>fr <Plug>(coc-references)

" Remap <C-f> and <C-b> to scroll float windows/popups
nmap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nmap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
imap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
imap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vmap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vmap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" coc-fzf ---------------------------------------------------------------------
" Search outline
" Keep global fzf settings (e.g. preview right)
let g:coc_fzf_preview = ''
" Sort outline by first-line at the top of results
let g:coc_fzf_opts = ['--layout=reverse-list']
let g:coc_fzf_preview_toggle_key = '/'
nmap <leader>so :CocFzfList outline<CR>

" vim-dispatch ----------------------------------------------------------------
nmap <leader>di :Dispatch<Space>

" vim-test --------------------------------------------------------------------
let test#strategy = 'vimterminal'
let test#python#runner = 'pytest'
nmap <leader>tn :TestNearest<CR>
nmap <leader>tf :TestFile<CR>
nmap <leader>tt :TestSuite<CR>
nmap <leader>tl :TestLast<CR>
nmap <leader>tv :TestVisit<CR>

" fzf.vim ---------------------------------------------------------------------
let g:fzf_history_dir = '~/.local/share/fzf-history'
let $FZF_DEFAULT_OPTS = "\
  \ --preview-window 'right:57%'
  \ --preview 'bat --style=numbers --line-range :300 {}'
  \ --bind ctrl-y:preview-up,ctrl-e:preview-down
  \ --bind ctrl-b:page-up,ctrl-f:page-down
  \ --bind ctrl-u:half-page-up,ctrl-d:half-page-down"

" Find files
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore=.git -g ""'
nmap <leader>ff :Files<CR>
nmap <leader>fg :GFiles<CR>
" Find opened buffers
nmap <leader>fb :Buffers<CR>
" Find opened windows
nmap <leader>fw :Windows<CR>
" Files history
nmap <leader>fh :History<CR>

" Search content and not filename (https://github.com/junegunn/fzf.vim/issues/346)
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
nmap <leader>ss :Ag <CR>
" Search selected under cursor
nmap <leader>S :Ag <C-R><C-W><CR>
" Search in current buffer
nmap <leader>sl :BLines<CR>
" Search tags in current buffer
nmap <leader>st :BTags<CR>
" Search history
nmap <leader>sh :History/<CR>
" Search commits
nmap <leader>sc :Commits<CR>

" vim-repl --------------------------------------------------------------------
nmap <leader>R :REPLToggle<Cr>
let g:sendtorepl_invoke_key = "<leader>rp"
let g:repl_program = {
    \ 'python': 'python -m asyncio',
    \ 'default': 'zsh',
    \ }

" quick-scope -----------------------------------------------------------------
highlight QuickScopePrimary guifg='#ffff00' gui=underline ctermfg=226 cterm=underline
highlight QuickScopeSecondary guifg='#ff5fff' gui=underline ctermfg=207 cterm=underline

" fugitive --------------------------------------------------------------------
nmap <leader>gg :Git<Space>
" https://github.com/tpope/vim-fugitive/discussions/2275
" nmap <leader>gs :Git<CR>
nmap <leader>gs :Gedit :<CR>
nmap <leader>gb :Git blame<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>gl :Git log --pretty=format:"%h %s <%an> (%ar)"<CR>

" vim-flog --------------------------------------------------------------------
nmap <leader>gf :Flogsplit<CR>

" undotree --------------------------------------------------------------------
if has('persistent_undo')
  set undofile
  set undodir=$HOME/.vim/undodir/
endif
nmap <leader>u :UndotreeToggle<CR>

" vim-bookmarks ---------------------------------------------------------------
let g:bookmark_no_default_key_mappings = 1
nmap <leader>mm <Plug>BookmarkToggle
nmap <leader>mi <Plug>BookmarkAnnotate
nmap <leader>ma <Plug>BookmarkShowAll
nmap <Leader>mc <Plug>BookmarkClear
nmap <Leader>mx <Plug>BookmarkClearAll

" vim-togglelist --------------------------------------------------------------
let g:toggle_list_no_mappings = 1
nmap <leader>ll :call ToggleLocationList()<CR>
nmap <leader>ql :call ToggleQuickfixList()<CR>

" Per-project settings
silent! so .vimlocal
