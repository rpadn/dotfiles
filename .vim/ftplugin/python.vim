" PEP8 indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=100
set colorcolumn=100
set expandtab
set autoindent
set fileformat=unix
set formatoptions-=t

" Flagging unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead *.py match BadWhitespace /\s\+$/
