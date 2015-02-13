set smartindent
set tabstop=4
set shiftwidth=4
set expandtab


execute pathogen#infect()
syntax on
filetype plugin indent on

"YouCompleteMe extra config
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
