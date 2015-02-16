set wrap linebreak nolist "If a line is longer than width of window it drops down to next line.

color molokai "Colortheme
set guifont=Inconsolata\ 12 "Font
let g:NERDTreeWinPos = "right" "NERDTree position
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" " displays <% %> correctly
set cpoptions+=$ " puts a $ marker for the end of words/lines in cw/c$ commands
set number " Sets line numbers to the left

"jj goes from insertmode to normalmode
inoremap jj <ESC> 

"Mapped the moving keys so they make more sense to me.
noremap j h
noremap k j
noremap l k
noremap ; l
noremap h ;
""noremap l h
""noremap ; l
""noremap h ;

"Mapping ctrl-c, ctrl-x and ctrl-v
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

"This is for the pathogen which is located in ./vim/autoload
execute pathogen#infect()
syntax on
filetype plugin indent on

"YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

"Some code from the laptop vim config..
let g:html_indent_inctags = "html,body,head,tbody" "Makes the smart indent for html indent these tags aswell.

map <silent> <F11>
            \   :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>  "It worked in the laptop making vim go fullscreen with pressing F11..

set guioptions-=T guioptions-=m "Makes the whitespace at the bottom and right a little smaller. 

source ~/dotfiles/vim/extraVimrc/autoclose.vim "Enables a vim file that completes braces, it can be found in the following path.


"Forces vim to source .vimrc file if it is present in the working directory.
set exrc
"Restrict usage of some commands for security
set secure

"Highlight the column of the 110 line too see if your lines are too long
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray
