"Load plugins from vim-plug
source ~/.config/nvim/plugins.vim

"Vim settings
"============================================================================
filetype plugin indent on
set exrc "Forces vim to source .vimrc file if it is present in the working directory.
set secure "Restrict usage of some commands for security

autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" "displays <% %> correctly

set number

set so=7 " set 7 lines to the cursors - when moving vertical
set wildmenu " enhanced command line completion
set hidden " current buffer can be put into background
set wildmode=list:longest " complete files like a shell
set scrolloff=3 " lines of text around cursor
set shell=$SHELL
set cmdheight=1 " command bar height

" Searching
set ignorecase " case insensitive searching
set hlsearch
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros
set magic " Set magic on, for regex

set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink

"Highlight the column of the 110 line too see if your lines are too long
set colorcolumn=100
highlight ColorColumn ctermbg=darkgray

set wrap "turn on line wrapping
set wrapmargin=8 " wrap lines when coming within n characters from side
set linebreak " set soft wrapping
set showbreak=… " show ellipsis at breaking

"Indent
set autoindent " automatically set indent of new line
set smartindent
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
"============================================================================


"Apperance
"============================================================================
syntax on
set encoding=utf8
let base16colorspace=256  "Access colors present in 256 colorspace

"execute "set background=".$BACKGROUND
"execute "colorscheme ".$THEME

set background=dark
colorscheme base16-atelierforest
"============================================================================


"Mappings
"============================================================================
" set a map leader for more key combos
let mapleader = ' '
let g:mapleader = ' '

"jj goes from insertmode to normalmode
inoremap jj <ESC>

"Save
map <C-s> :w<cr>

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
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>
nnoremap <leader>gbl :Gblame

"Switch buffers
nnoremap <leader>t :bn<cr>
nnoremap <leader>r :bp<cr>
nnoremap <C-w> gt
nnoremap <C-q> gT

"Open NERDTree
nnoremap <leader>n :NERDTreeToggle<cr>

map <silent> <C-h> :call WinMove('h')<cr>
map <silent> <C-j> :call WinMove('j')<cr>
map <silent> <C-k> :call WinMove('k')<cr>
map <silent> <C-l> :call WinMove('l')<cr>
"============================================================================

"Other
"============================================================================

"Move to the window in the direction shown, or create a new window
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction
"============================================================================
