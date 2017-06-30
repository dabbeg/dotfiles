" Vim Plug {{{
call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'janko-m/vim-test'
Plug 'Shougo/deoplete.nvim', { 'for': ['vim', 'javascript', 'python', 'css', 'html', 'latex', 'bash', 'cpp', 'c', 'cs', 'java'] }
Plug 'benekastah/neomake', { 'for': ['vim', 'javascript', 'python', 'css', 'html', 'latex', 'bash', 'cpp', 'c', 'cs', 'java'] }
"Plug 'Valloric/YouCompleteMe', { 'for': [] }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'cohama/lexima.vim'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'chriskempson/base16-vim'
"Plug 'tpope/vim-commentary'
"Plug 'mhinz/vim-grepper'
"Plug 'jeffkreeftmeijer/vim-numbertoggle'
"Plug 'wikitopian/hardmode'
"Plug 'tpope/vim-surround'
"Plug 'tpope/vim-repeat'
"Plug 'othree/html5.vim'
"Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
"Plug 'mxw/vim-jsx', { 'for': 'javascript' }
"Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
"Plug 'moll/vim-node', { 'for': 'javascript' }
"Plug 'elzr/vim-json', { 'for': 'json' }
"Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
"Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' }
"Plug 'tpope/vim-markdown', { 'for': 'markdown' }
"Plug 'hdima/python-syntax', { 'for': 'python' }
"Plug 'starcraftman/vim-eclim', { 'for': 'java' }
"Plug 'vim-ctrlspace/vim-ctrlspace'

function! BuildComposer(info)
    if a:info.status != 'unchanged' || a:info.force
        !cargo build --release
        UpdateRemotePlugins
    endif
endfunction

"Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
call plug#end()
" }}}

" YouCompleteMe {{{
let g:ycm_global_ycm_extra_conf = '/home/dabbeg/.config/nvim/plugged/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_confirm_extra_conf = 0
" }}}

" NeoSnippets {{{
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
" }}}

" NeoMake {{{
autocmd! User neomake autocmd! BufWritePost * Neomake

let g:neomake_javascript_jscs_maker = {
            \ 'exe': 'jscs',
            \ 'args': ['--no-color', '--preset', 'airbnb', '--reporter', 'inline', '--esnext'],
            \ 'errorformat': '%f: line %l\, col %c\, %m',
            \ }
let g:neomake_javascript_enabled_makers = ['jshint', 'jscs']

"let g:neomake_javascript_enabled_makers = ['eslint']
"let g:neomake_verbose=3
" }}}

" Latex {{{
"Though this is not a plugin I thought it should be here
autocmd! BufWritePost *.tex !pdflatex %
" }}}

" Brace completion {{{
let g:lexima_enable_basic_rules = 1
" }}}

" Python Syntax {{{
let python_highlight_all = 1
let b:python_version_2 = 1
" }}}

" Vim-cpp-enhanced-highlight {{{
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
" }}}

" vim-airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='base16'

"let g:airline_exclude_preview = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#ctrlspace#enabled = 1
let g:CtrlSpaceStatuslineFunction = "airline#extensions#ctrlspace#statusline()"
" }}}

" Ctrl-p {{{
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_prompt_mappings = {
            \ 'AcceptSelection("e")': ['<c-t>'],
            \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
            \ }
" }}}

" deocomplete {{{
let g:deoplete#enable_at_startup = 1
" }}}

" Markdown composer {{{
let g:markdown_composer_open_browser = 1
" }}}

" NERDTree Settings {{{
let g:NERDTreeWinSize=25
let NERDTreeShowBookmarks=1
let NERDTreeHijackNetrw = 0
let NERDTreeIgnore=['\.meta$', '\.pyc$']

nnoremap <leader>n :NERDTreeToggle<cr>
" }}}

" vim-jsx {{{
let g:jsx_ext_required = 0
" }}}

" Fugitive {{{
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
" }}}

" Grepper {{{
nnoremap <leader>git :Grepper -tool git<cr>
nnoremap <leader>ag  :Grepper -tool ag  -grepprg ag --vimgrep -G '^.+\.txt'<cr>
nnoremap <leader>*   :Grepper -tool ack -cword -noprompt<cr>
" }}}

" Base-16 {{{
" Setting colorscheme and background
"let &background = GetBackgroundColor()
"execute "colorscheme " . GetColorTheme()
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
" }}}

" Ctrl-space {{{
nnoremap <silent><C-p> :CtrlSpace O<CR>

let g:CtrlSpaceSymbols = { "CS": "#", "File": "◯", "CTab": "▣", "Tabs": "▢" }

if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1

hi CtrlSpaceSelected ctermfg=White  ctermbg=60    cterm=bold
hi CtrlSpaceSearch   ctermfg=Yellow ctermbg=NONE  cterm=NONE
hi CtrlSpaceStatus   ctermfg=Red    ctermbg=Blue  cterm=NONE
hi CtrlSpaceNormal   ctermfg=White  ctermbg=Black cterm=NONE
" }}}
