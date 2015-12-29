call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'bling/vim-airline'          "Vim statusline
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
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'wikitopian/hardmode'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-repeat'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
"Plug 'hdima/python-syntax', { 'for': 'python' }
"Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

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
let g:startify_bookmarks = [ '', {'v': '~/dotfiles/nvim/init.vim'}, {'p': '~/dotfiles/nvim/plugins.vim'}, {'z': '~/dotfiles/zshrc' }, {'i3': '~/dotfiles/i3/config'} ]
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

let g:neomake_javascript_jscs_maker = {
    \ 'exe': 'jscs',
    \ 'args': ['--no-color', '--preset', 'airbnb', '--reporter', 'inline', '--esnext'],
    \ 'errorformat': '%f: line %l\, col %c\, %m',
    \ }
let g:neomake_javascript_enabled_makers = ['jshint', 'jscs']
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
