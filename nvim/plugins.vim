call plug#begin()

" NERDTree {{{
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle', 'for': ['vim', 'javascript', 'python', 'css', 'html', 'bash', 'java'] }

let g:NERDTreeWinSize=30
let NERDTreeShowBookmarks=1
let NERDTreeHijackNetrw = 0
let NERDTreeIgnore=['\.meta$', '\.pyc$']

nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>f :NERDTreeFind<cr>
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

function! GetFullPath(executable)
    let root_path = substitute(system('git rev-parse --show-toplevel'), '\n\+$', '', '')
    let full_path = root_path . '/' . a:executable
    return full_path
endfunction

autocmd! User neomake autocmd! BufWritePost * Neomake
if system('pwd') =~ 'tempo'
    let g:neomake_javascript_tempo_maker = {
        \ 'exe': GetFullPath('node_modules/eslint/bin/eslint.js'),
        \ 'args': ['-f', 'compact'],
        \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
        \   '%W%f: line %l\, col %c\, Warning - %m,%-G,%-G%*\d problems%#'
    \ }
    let g:neomake_javascript_enabled_makers = ['tempo']
else
    let g:neomake_javascript_enabled_makers = ['eslint']
endif
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_logfile='/tmp/neomake.log'
" }}}

" deocomplete {{{
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocomplete
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/neco-vim'

let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = '/usr/bin/python'
" }}}

" fzf {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzyfinder

let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
map <C-b> :FZF<cr>
"}}}

" Commentary {{{
Plug 'tpope/vim-commentary'
" }}}

" vim-fugitive {{{
Plug 'tpope/vim-fugitive'
" }}}

" vim-grepper {{{
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
map <C-g> :Grepper -tool git<cr>
" }}}

" vim-test {{{
Plug 'janko-m/vim-test', { 'for': ['javascript'] }
" }}}
call plug#end()
