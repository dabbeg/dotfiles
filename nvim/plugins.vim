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
" Plug 'benekastah/neomake', { 'for': ['vim', 'javascript', 'python', 'css', 'html', 'latex', 'bash', 'cpp', 'c', 'cs', 'java'] }

function! GetFullPath(repo, executable)
    let root_path = substitute(system('git rev-parse --show-toplevel'), '\n\+$', '', '')
    let full_path = root_path . '/' . a:repo . '/' . a:executable
    return full_path
endfunction

autocmd! User neomake autocmd! BufWritePost * Neomake
if system('pwd') =~ 'tempo'
    let g:neomake_javascript_tempo_maker = {
        \ 'exe': GetFullPath('src/io', 'node_modules/eslint/bin/eslint.js'),
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

" React {{{
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" }}}

" vim-test {{{
Plug 'janko-m/vim-test', { 'for': ['javascript'] }
" }}}

" Colorscheme {{{
Plug 'chriskempson/base16-vim'
" }}}

" vim-surround {{{
Plug 'tpope/vim-surround'
" }}}

" vim-gitgutter {{{
Plug 'airblade/vim-gitgutter'
set updatetime=100
let g:gitgutter_map_keys = 0

" Always show signcolumn
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

" Next and Prev hunk
function! NextHunkAllBuffers()
  let line = line('.')
  GitGutterNextHunk
  if line('.') != line
    return
  endif

  let bufnr = bufnr('')
  while 1
    bnext
    if bufnr('') == bufnr
      return
    endif
    if !empty(GitGutterGetHunks())
      normal! 1G
      GitGutterNextHunk
      return
    endif
  endwhile
endfunction

function! PrevHunkAllBuffers()
  let line = line('.')
  GitGutterPrevHunk
  if line('.') != line
    return
  endif

  let bufnr = bufnr('')
  while 1
    bprevious
    if bufnr('') == bufnr
      return
    endif
    if !empty(GitGutterGetHunks())
      normal! G
      GitGutterPrevHunk
      return
    endif
  endwhile
endfunction

nmap <silent> <leader>. :call NextHunkAllBuffers()<CR>
nmap <silent> <leader>, :call PrevHunkAllBuffers()<CR>
" }}}

" Ale {{{
Plug 'w0rp/ale'
let g:airline#extensions#ale#enabled = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\}
nmap <silent> <leader>x :call ALEFix
" }}}
call plug#end()

" This needs to be run after plug#end() so that base16-vim has loaded
if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif
