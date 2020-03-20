set nocompatible  " Required
filetype off      " Required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sickill/vim-monokai'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'davidhalter/jedi-vim'
Plugin 'psf/black'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'majutsushi/tagbar'
Plugin 'dense-analysis/ale'
Plugin 'ludovicchabant/vim-gutentags'

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
nnoremap , <Nop>
let mapleader = ","

" Enable folding with the spacebar
"nnoremap <Leader>w za

" split vertically
nnoremap <leader>v :vsplit<CR>
" split horizontally
nnoremap <leader>h :split<CR>

" Removes highlight of last search
nnoremap <Leader><space> :nohl<CR>

" New empty buffer
nnoremap <leader>b :tabnew<CR>

" Make backspace work as normal again
set bs=2

" Proper PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=88 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Full-stack development indentation
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2
    \ set shiftwidth=2

" Shell scripts
au BufNewFile,BufRead *.csh
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

" Commands for converting whole indentation to spaces and tabs
"map <Leader>t :set ts=4 noet <bar> retab!<CR> 
"map <Leader>T :set ts=4 et <bar> retab!<CR>

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

" faster esc
inoremap jj <esc>

" Quick commands
noremap <leader>w :w<CR>
noremap <leader>q :q<CR> 
"noremap <Leader>E :qa!<CR>  " Quit all windows
nnoremap <leader>c :bd<CR> " Unload current buffer

" Close all buffers but current
map <leader>o :%bd\|e#<cr>

" Quickly open a buffer for scribble
map <leader>e :e ~/.vim/tmp/buffer<cr>

" Easier moving between tabs
map <Leader>, <Esc>:tabprevious<CR>
map <Leader>. <Esc>:tabnext<CR>

" Map sort function to a key
vnoremap <Leader>s :sort<CR>

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

" Syntax highlight Giggle scripts as LUA
au BufReadPost *.ggl set syntax=lua

" Toggle paste mode on an off, specially for pasting code lines
:nnoremap <leader>pp :set invpaste<CR>
    
" Toggle invisible characters
set listchars=tab:»\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

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

" NERDTree --------------------------------------------------------------------
map <leader>t :NERDTreeToggle<CR>
map <leader>n :NERDTreeFind<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']

" CtrlP -----------------------------------------------------------------------
let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_custom_ignore = 'otls|\.git|\.build'
nnoremap <C-T> :CtrlPTag<CR>
" use ctrlp-py-matcher
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" Papercolor-theme ------------------------------------------------------------
set background=dark
colorscheme PaperColor
"colorscheme monokai

" Ack -------------------------------------------------------------------------
nnoremap <leader>a :Ack 

" vim-jedi --------------------------------------------------------------------
let g:jedi#popup_on_dot = 0
let g:jedi#usages_command = "<leader>u"

" tagbar ----------------------------------------------------------------------
nmap <F8> :TagbarToggle<CR>

" vim-fugitive/vim-rhubarb
" github enterprise for GBrowse
let g:github_enterprise_urls = ['https://github.ps.thmulti.com']

" ALE -------------------------------------------------------------------------
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
