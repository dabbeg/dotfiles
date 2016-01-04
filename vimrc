"Execute the pathogen which is located in ./vim/autoload
"============================================================================
execute pathogen#infect()
syntax on
filetype plugin indent on
"============================================================================

"Vim settings
"============================================================================
set exrc "Forces vim to source .vimrc file if it is present in the working directory.
set secure "Restrict usage of some commands for security
"============================================================================

"Apperance
"============================================================================
set wrap linebreak nolist "If a line is longer than width of window it drops down to next line.

colorscheme badwolf
" Make the gutters darker than the background.
let g:badwolf_darkgutter = 1

autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" "displays <% %> correctly
set number "Sets line numbers to the left

"Highlight the column of the 110 line too see if your lines are too long
set colorcolumn=100
highlight ColorColumn ctermbg=darkgray

"Restore cursor position
set hidden

"Indent length
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
"============================================================================

"Mappings
"============================================================================
"jj goes from insertmode to normalmode
inoremap jj <ESC> 

"Mapping ctrl-c, ctrl-x and ctrl-v
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

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
source ~/.vim/extraVimrc/autoclose.vim "Enables a vim file that completes braces.
"============================================================================

"Powerline settings for vim
"============================================================================
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
"============================================================================

"NERDTree Settings
"============================================================================
let g:NERDTreeWinSize=25
let NERDTreeShowBookmarks=1
autocmd VimEnter * NERDTree
"============================================================================

"NeoComplete Settings
"============================================================================
let g:neocomplete#enable_at_startup=1
"============================================================================
