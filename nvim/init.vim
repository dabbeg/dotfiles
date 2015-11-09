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
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'wikitopian/hardmode'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
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

"set list!
"set listchars=space:·,trail:~

autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" "displays <% %> correctly

set ttyfast " faster redrawing
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
"set smartcase " case-sensitive if expresson contains a capital letter
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
set shiftwidth=4
set expandtab
"============================================================================


"Apperance
"============================================================================
syntax on
set encoding=utf8
let base16colorspace=256  "Access colors present in 256 colorspace
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"

"execute "set background=".$BACKGROUND
"execute "colorscheme ".$THEME

set background=dark
colorscheme base16-atelierforest
"color up
"color badwolf
"color molokai
"
"============================================================================


"Mappings
"============================================================================
" set a map leader for more key combos
let mapleader = ','
let g:mapleader = ','

"jj goes from insertmode to normalmode
inoremap jj <ESC>

"Mapped the moving keys so they make more sense to me.
noremap j h
noremap k j
noremap l k
noremap ; l
noremap h ;

noremap <space> :

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

let NERDTreeHijackNetrw = 0
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

"Startify
"============================================================================
autocmd User Startified setlocal cursorline
let g:startify_files_number = 7
let g:startify_session_persistence = 1
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_enable_special = 0
let g:startify_session_autoload = 1
let g:startify_session_dir = '~/dotfiles/nvim//session'
let g:startify_list_order = [ [ '   Bookmarks:' ], 'bookmarks', [ '   MRU:' ], 'files', [ '   Sessions:' ], 'sessions']
let g:startify_bookmarks = [ '', {'v': '~/dotfiles/nvim/init.vim'}, '~/dotfiles/zshrc' ]
highlight StartifyBracket ctermfg = 240
highlight StartifyFooter  ctermfg = 240
highlight StartifyHeader  ctermfg = 114
highlight StartifyNumber  ctermfg = 215
highlight StartifyPath    ctermfg = 245
highlight StartifySlash   ctermfg = 240
highlight StartifySpecial ctermfg = 240

function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
    let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction
let g:startify_custom_header = s:filter_header(map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['',''])

" Hacky way to disable Powerline in Startify
augroup startify
  autocmd!
  autocmd BufNew * set laststatus=2|highlight CursorLine guibg=NONE
  autocmd FileType startify set laststatus=0|highlight CursorLine guibg=#000000|setlocal cursorline
augroup END
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

"Ctrl-p
"============================================================================
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
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
