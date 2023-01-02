" PEP8 indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=88
set colorcolumn=88
set expandtab
set autoindent
set fileformat=unix

" Flagging unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead *.py match BadWhitespace /\s\+$/


" ALE
let g:ale_linters = {
\   'python': ['pylsp']
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort']
\}
let g:ale_python_pylsp_config={'pylsp': {
  \ 'configurationSources': ['flake8'],
  \ 'plugins': {
  \   'pycodestyle': {'enabled': v:false},
  \   'pyflakes': {'enabled': v:false},
  \   'pydocstyle': {'enabled': v:false},
  \   'mccabe': {'enabled': v:false},
  \   'flake8': {'enabled': v:true},
  \   'pylsp_mypy': {'enabled': v:true, 'live_mode': v:false},
  \   'pylsp_black': {'enabled': v:true},
  \   'pyls_isort': {'enabled': v:true},
  \ },
  \ }}
" let g:ale_python_pylsp_options = '--log-file /home/rpadn/dev/tmp/pylsp.log -vvv'
