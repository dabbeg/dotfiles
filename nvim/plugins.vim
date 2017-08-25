call plug#begin()

" NERDTree {{{
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

let g:NERDTreeWinSize=25
let NERDTreeShowBookmarks=1
let NERDTreeHijackNetrw = 0
let NERDTreeIgnore=['\.meta$', '\.pyc$']

nnoremap <leader>n :NERDTreeToggle<cr>
" }}}

" vim-airline {{{
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '❯'
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='base16'
" }}}

" NeoMake {{{
Plug 'benekastah/neomake', { 'for': ['vim', 'javascript', 'python', 'css', 'html', 'latex', 'bash', 'cpp', 'c', 'cs', 'java'] }

autocmd! User neomake autocmd! BufWritePost * Neomake
let g:neomake_javascript_jscs_maker = {
            \ 'exe': 'jscs',
            \ 'args': ['--no-color', '--preset', 'airbnb', '--reporter', 'inline', '--esnext'],
            \ 'errorformat': '%f: line %l\, col %c\, %m',
            \ }
let g:neomake_javascript_enabled_makers = ['jshint', 'jscs']
" }}}

" deocomplete {{{
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocomplete
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/neco-vim'

let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = '/usr/bin/python'
" }}}

" Lexima {{{
Plug 'cohama/lexima.vim'

let g:lexima_enable_basic_rules = 1
" }}}

" fzf {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzyfinder

let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
map <C-b> :FZF<cr>
"}}}

" Commentary {{{
Plug 'tpope/vim-commentary'
" }}}

call plug#end()
