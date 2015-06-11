execute pathogen#infect()
syntax on
filetype plugin indent on

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab



"YouCompleteMe extra config
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

"Forces vim to source .vimrc file if it is present in the working directory.
set exrc
"Restrict usage of some commands for security
set secure


"Highlight the column of the 110 line too see if your lines are too long
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

"Powerline settings for vim
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
"let g:Powerline_symbols = 'fancy'
