"Execute the vim-plugin plugin manager which is located in ./vim/autoload
"============================================================================
filetype plugin indent on

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'bling/vim-airline'          "Vim statusline
Plug 'janko-m/vim-test'           "Plugin for running tests
Plug 'Shougo/deoplete.nvim', { 'for': ['vim', 'javascript', 'python', 'java', 'css', 'html', 'latex', 'bash'] }
Plug 'benekastah/neomake', { 'for': ['vim', 'javascript', 'python', 'java', 'css', 'html', 'latex', 'bash'] }
Plug 'Shougo/neosnippet'          "Snippets
Plug 'Shougo/neosnippet-snippets' "Snippets
Plug 'cohama/lexima.vim'          "Brace completion
Plug 'ctrlpvim/ctrlp.vim'         "Easy access to files
Plug 'tpope/vim-fugitive'         "Git wrapper
Plug 'chriskempson/base16-vim'    "Colorscheme
Plug 'tpope/vim-commentary'       "Comment
"Plug 'hdima/python-syntax', { 'for': 'python' }
"Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

function! BuildYCM(info)
    if a:info.status != 'unchanged' || a:info.force
        !python2 $HOME/dotfiles/nvim/plugged/YouCompleteMe/install.py --clang-completer --omnisharp-completer
    endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM'), 'for': ['cpp', 'c'] }

function! BuildPolyglot(info)
  if a:info.status != 'unchanged' || a:info.force
    !bash $HOME/dotfiles/nvim/plugged/vim-polyglot/build
  endif
endfunction

Plug 'sheerun/vim-polyglot', { 'do': function('BuildPolyglot') }

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
    UpdateRemotePlugins
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
call plug#end()
"============================================================================

"Vim settings
"============================================================================
set exrc "Forces vim to source .vimrc file if it is present in the working directory.
set secure "Restrict usage of some commands for security

set list!
set listchars=space:·,trail:~
"============================================================================


"Apperance
"============================================================================
set wrap linebreak "If a line is longer than width of window it drops down to next line.

syntax on
set encoding=utf8
let base16colorspace=256  " Access colors present in 256 colorspace"
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"

"execute "set background=".$BACKGROUND
"execute "colorscheme ".$THEME

set background=dark
colorscheme base16-atelierforest
"color up
"colorscheme colorsbox-stnight
"color badwolf
"color molokai

set ttyfast " faster redrawing
set showmatch " show matching braces

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
" set a map leader for more key combos
let mapleader = ' '
let g:mapleader = ' '

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

"Open NERDTree
nnoremap <leader>n :NERDTreeToggle<cr>

"Make it easier to switch between windows
nnoremap 1 <C-W><C-W>

map <silent> <C-h> :call WinMove('h')<cr>
map <silent> <C-j> :call WinMove('j')<cr>
map <silent> <C-k> :call WinMove('k')<cr>
map <silent> <C-l> :call WinMove('l')<cr>

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
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


"Indent
"============================================================================
let g:html_indent_inctags = "html,body,head,tbody" "Makes the smart indent for html indent these tags aswell.
"============================================================================

"YCM
"============================================================================
set completeopt-=preview
let g:ycm_global_ycm_extra_conf = '/home/dabbeg/dotfiles/nvim/.ycm_extra_conf.py'
"============================================================================

"NeoSnippets
"============================================================================
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<TAB>" : "\<Plug>(neosnippet_expand_or_jump)"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
"============================================================================

"NeoMake
"============================================================================
autocmd! User neomake autocmd! BufWritePost * Neomake
"============================================================================

"Brace completion
"============================================================================
let g:lexima_enable_basic_rules = 1
"============================================================================

"python-syntax
"============================================================================
let python_highlight_all = 1
let b:python_version_2 = 1
"============================================================================

"vim-cpp-enhanced-highlight
"============================================================================
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
"============================================================================

"vim-airline
"============================================================================
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='base16'
"============================================================================

"deocomplete
"============================================================================
let g:deoplete#enable_at_startup = 1
"============================================================================

"Markdown composer
"============================================================================
let g:markdown_composer_open_browser = 1
"============================================================================

"NERDTree Settings
"============================================================================
"The size of NERDTree window
let g:NERDTreeWinSize=25
let NERDTreeShowBookmarks=1

"At start open NERDTree
"autocmd VimEnter * NERDTree
"============================================================================
