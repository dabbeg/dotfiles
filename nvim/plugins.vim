call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'bling/vim-airline'          "Vim statusline
Plug 'vim-airline/vim-airline-themes'
Plug 'janko-m/vim-test'           "Plugin for running tests
Plug 'Shougo/deoplete.nvim', { 'for': ['vim', 'javascript', 'python', 'java', 'css', 'html', 'latex', 'bash', 'cpp', 'c'] }
Plug 'benekastah/neomake', { 'for': ['vim', 'javascript', 'python', 'java', 'css', 'html', 'latex', 'bash', 'cpp', 'c'] }
Plug 'Shougo/neosnippet'          "Snippets
Plug 'Shougo/neosnippet-snippets' "Snippets
Plug 'cohama/lexima.vim'          "Brace completion
Plug 'ctrlpvim/ctrlp.vim'         "Easy access to files
Plug 'tpope/vim-fugitive'         "Git wrapper
Plug 'chriskempson/base16-vim'    "Colorscheme
Plug 'tpope/vim-commentary'       "Comment
Plug 'mhinz/vim-grepper'          "Grepper
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'wikitopian/hardmode'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
"Plug 'moll/vim-node', { 'for': 'javascript' }
"Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
"Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' }
"Plug 'tpope/vim-markdown', { 'for': 'markdown' }
"Plug 'hdima/python-syntax', { 'for': 'python' }

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
    UpdateRemotePlugins
  endif
endfunction

"Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
call plug#end()

"NeoSnippets
"============================================================================
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" <Tab> completion:
" 1. If popup menu is visible, select and insert next item
" 2. Otherwise, if within a snippet, jump to next input
" 3. Otherwise, if preceding chars are whitespace, insert tab char
" 4. Otherwise, start manual autocomplete
imap <silent><expr><Tab> pumvisible() ? "\<C-n>"
	\ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
	\ : (<SID>is_whitespace() ? "\<Tab>"
	\ : deoplete#mappings#manual_complete()))

smap <silent><expr><Tab> pumvisible() ? "\<C-n>"
	\ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
	\ : (<SID>is_whitespace() ? "\<Tab>"
	\ : deoplete#mappings#manual_complete()))

inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:is_whitespace()
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~? '\s'
endfunction

let g:neosnippet#disable_runtime_snippets = {
\   '_': 1,
\ }
let g:neosnippet#snippets_directory='~/.config/nvim/snippets/'
"============================================================================

"NeoMake
"============================================================================
autocmd! User neomake autocmd! BufWritePost * Neomake

let g:neomake_javascript_jscs_maker = {
    \ 'exe': 'jscs',
    \ 'args': ['--no-color', '--preset', 'airbnb', '--reporter', 'inline', '--esnext'],
    \ 'errorformat': '%f: line %l\, col %c\, %m',
    \ }
let g:neomake_javascript_enabled_makers = ['jshint', 'jscs']

"let g:neomake_javascript_enabled_makers = ['eslint']
"let g:neomake_verbose=3
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
let g:NERDTreeWinSize=25
let NERDTreeShowBookmarks=1
let NERDTreeHijackNetrw = 0
"============================================================================

"vim-jsx
"============================================================================
let g:jsx_ext_required = 0
"============================================================================
