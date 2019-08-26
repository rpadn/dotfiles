" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" Return to last edit position when opening files (You want this!)
"if has("autocmd")
"   au BufReadPost * if line("'\"""'") > 0 && line("'\"""'") <= line("$")
"   \| exe "normal! g'\"" | endif
"endif

" Show (partial) command in status line.
set showcmd
" Show matching brackets.
set showmatch
" Do case insensitive matching
set ignorecase
" Do smart case matching
set smartcase
" Incremental search
set incsearch
" Automatically save before commands like :next and
"set autowrite
" Hide buffers when they are abandoned
set hidden
" Enable mouse usage (all modes)
set mouse=a
" For regular expressions turn magic on
set magic


set textwidth=119
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set colorcolumn=120

" Use system clipboard
set clipboard=unnamed

au BufNewFile,BufRead *.py
    \ set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=119 expandtab autoindent
au BufNewFile,BufRead *.py
    \ nnoremap <buffer> <F5> :exec '!python' shellescape(@%, 1)<CR>

au BufNewFile,BufRead *.html
    \ set tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.css
    \ set tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.scss
    \ set tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.js
    \ set tabstop=2 softtabstop=2 shiftwidth=2

" Highlight current line
set cursorline  

set backspace=indent,eol,start 

set hlsearch
set so=10

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

command WQ wq
command Wq wq
command W w
command Q q


set number
set scrolloff=5       " keep at least 5 lines above/below

set cot+=menuone
set incsearch

set encoding=utf-8
set listchars=tab:▸\ ,eol:¬

syntax enable
set t_Co=256 
filetype on
filetype plugin indent on

"set font 
"set gfn=Hack\ Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11


" This is totally awesome - remap jj to escape in insert mode.  You'll never
" type jj anyway, so it's great!
inoremap jj <Esc>

let mapleader = ","
" split vertically
nnoremap <leader>v <C-w>v<C-w>l
" split horizontally
nnoremap <leader>h <C-w>s<C-w>j

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" on esc clean search highlight
nnoremap <leader><space> :noh<esc>

" Tab navigation
nnoremap <leader><tab> :bnext<CR>
nnoremap <leader><S-tab> :bprev<CR>
" close buffer only with NERDTree open
nnoremap <leader>c :bp<cr>:bd #<cr>
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<CR>
" Quick save
map <leader>w :w<CR>
" Quick close
map <leader>q :q<CR>

" Quickly open a buffer for scribble
map <leader>e :e ~/buffer<cr>


au BufNewFile *.py 0r ~/.vim/skeletons/python.skel | let IndentStyle = "python"

""""""""""""""""""""""""""""""""

""""""" P L U G I N S """"""""""

""""""""""""""""""""""""""""""""
"  pathogen
" just put new plugins in .vim/bundle and thats'it!
call pathogen#infect()


" colorscheme 
"let g:solarized_termcolors=256
set background=dark " dark | light "
colorscheme solarized


" ack
nnoremap <leader>a :Ack 


"  MiniBufExplorer
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1 
 

" ctrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
"nnoremap <leader>p :CtrlP .<CR>
"nnoremap <leader>b :CtrlPBuffer<CR>
"nnoremap <C-b> :CtrlPBuffer<CR>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP .'
"let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_working_path_mode = 'ca'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'


" vim-airline
" Always show the status line
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
let g:airline_solarized_bg = 'dark'

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
"nmap <leader>n <Plug>AirlineSelectPrevTab
"nmap <leader>p <Plug>AirlineSelectNextTab


" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_python_python_exec = '/usr/bin/python3'


" Syntax highliting
" cpp
let g:cpp_class_scope_highlight = 1
" python
let python_highlight_all=1


" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<cr>

" Start NERDTree
autocmd VimEnter * NERDTreeFind
" Jump to the main window.
autocmd VimEnter * wincmd p


" Close if last tab is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && 
    \ b:NERDTree.isTabTree()) | q | endif

" TagBar
nnoremap <leader>t :Tagbar<CR>

" vim-jedi
let g:jedi#usages_command = "<leader>u"

" ale
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

