"Execute the pathogen which is located in ./vim/autoload
"============================================================================
syntax on
filetype plugin indent on

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
call plug#end()
"============================================================================


"Vim settings
"============================================================================
"Auto source vimrc on save
""augroup myvimrc
""    au!
""    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
""augroup END

set exrc "Forces vim to source .vimrc file if it is present in the working directory.
set secure "Restrict usage of some commands for security

set list!
set listchars=space:·,trail:~
"============================================================================


"Apperance
"============================================================================
set wrap linebreak "If a line is longer than width of window it drops down to next line.

"color up
"colorscheme colorsbox-stnight
color badwolf
"color molokai
"
set guifont=Sauce\ Code\ Powerline\ Medium\ 15

autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" "displays <% %> correctly
set number "Sets line numbers to the left

"Highlight the column of the 110 line too see if your lines are too long
set colorcolumn=100
highlight ColorColumn ctermbg=darkgray

"Restore cursor position
set hidden

"Indent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
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

"Mapping ctrl-c, ctrl-x and ctrl-v
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

"Mapping keys for building and running with make from vim
nnoremap <F5> :make<cr>
nnoremap <F6> :make run<cr>
nnoremap <F7> :make runInput<cr>

" fugitive git bindings
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>

"Make it easier to switch between windows
nnoremap 1 <C-W><C-W>
"============================================================================

"Indent
"============================================================================
let g:html_indent_inctags = "html,body,head,tbody" "Makes the smart indent for html indent these tags aswell.
"============================================================================

"Plugins
"============================================================================
""let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

"Brace completion called autoclose
""source ~/.vim/extraVimrc/autoclose.vim "Enables a vim file that completes braces.

"Powerline settings for vim
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2

"NERDTree Settings
"NERDTree mapping to let nerdtree always display current directory of the document selected.
""map <leader>r :NERDTreeFind<cr>
""autocmd BufEnter * lcd %:p:h

"The size of NERDTree window
let g:NERDTreeWinSize=25
let NERDTreeShowBookmarks=1

"At start open NERDTree
autocmd VimEnter * NERDTree
"============================================================================