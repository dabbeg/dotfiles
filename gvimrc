"Execute the pathogen which is located in ./vim/autoload
"============================================================================
execute pathogen#infect()
syntax on
filetype plugin indent on
"============================================================================


"Apperance
"============================================================================
set wrap linebreak nolist "If a line is longer than width of window it drops down to next line.

color codeschool
""color molokai 
""color nazca
""color distinguished

set guifont=Inconsolata\ for\ Powerline\ 15 "Special font for powerline
set guioptions-=T "Removes top toolbar
set guioptions-=r "Removes right hand scroll bar
set go-=L "Removes left hand scroll bar
autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" "displays <% %> correctly
set cpoptions+=$ "puts a $ marker for the end of words/lines in cw/c$ commands
set guioptions-=T guioptions-=m "Makes the whitespace at the bottom and right a little smaller. 
set number "Sets line numbers to the left

set exrc "Forces vim to source .vimrc file if it is present in the working directory.
set secure "Restrict usage of some commands for security

"Highlight the column of the 110 line too see if your lines are too long
set colorcolumn=100
highlight ColorColumn ctermbg=darkgray

"Close vim if there is only one window open
autocmd bufenter * if (winnr("$") == 1) | q | endif

"Highlight all names that is the same as the one that's focused
"autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

Helptags
"============================================================================


"Mappings
"============================================================================
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

"Mapping keys for building and running with make from vim
nnoremap <F5> :make<cr>
nnoremap <F6> :make run<cr>
nnoremap <F7> :make runInput<cr>
"============================================================================


"YouCompleteMe
"============================================================================
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
"============================================================================


"Html
"============================================================================
let g:html_indent_inctags = "html,body,head,tbody" "Makes the smart indent for html indent these tags aswell.
"============================================================================


"Brace completion called autoclose
"============================================================================
source ~/dotfiles/vim/extraVimrc/autoclose.vim "Enables a vim file that completes braces.
"============================================================================


"Powerline settings for vim
"============================================================================
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
let g:Powerline_symbols = 'fancy'

let g:Powerline_dividers_override = ['', '', '', '']
let g:Powerline_symbols_override = { 'BRANCH': '', 'LINE': '', 'RO': '' }
"============================================================================


"NERDTree Settings
"============================================================================
""let g:NERDTreeWinPos = "right" "NERDTree position

"NERDTree mapping to let nerdtree always display current directory of the document selected.
map <leader>r :NERDTreeFind<cr>
autocmd BufEnter * lcd %:p:h

"The size of NERDTree window
let g:NERDTreeWinSize=25

"At start open NERDTree
NERDTree
"============================================================================
