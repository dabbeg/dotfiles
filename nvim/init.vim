" Basic Settings --------- {{{
filetype plugin indent on
set exrc "Forces vim to source .vimrc file if it is present in the working directory.
set secure "Restrict usage of some commands for security

set number
set relativenumber
set foldlevelstart=0

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
"set colorcolumn=100
"highlight ColorColumn ctermbg=darkgray

set wrap "turn on line wrapping
"set wrapmargin=8 " wrap lines when coming within n characters from side
set linebreak " set soft wrapping
set showbreak=… " show ellipsis at breaking
set list listchars=trail:·

"Indent
set autoindent " automatically set indent of new line
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" }}}

" Apperance {{{
syntax on
let base16colorspace=256  "Access colors present in 256 colorspace

"Colorscheme is set in plugins.vim

"Highlight current line
set cursorline

"Make current linenumber yellow
hi CursorLineNR ctermfg=yellow
" }}}

" FileType Settings ------------------------ {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim nnoremap <localleader>c I"<esc>
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_python
    autocmd!
    autocmd FileType python nnoremap <localleader>c I#<esc>
augroup END

augroup filetype_javascript
    autocmd!
    autocmd FileType javascript nnoremap <localleader>c I//<esc>
    autocmd FileType javascript iabbrev <buffer> iff if()<left>
augroup END

augroup filetype_bash
    autocmd!
    autocmd FileType sh iabbrev <buffer> iff if []; then
augroup END
" }}}

" Mappings {{{
" set a map leader for more key combos
let mapleader = ' '
let maplocalleader = ' '

"jj goes from insertmode to normalmode
inoremap jk <ESC>

"Save
noremap <C-s> :w<cr>

"Take search highlighting
noremap <leader>h :noh<cr>

"Mapping ctrl-c, ctrl-x and ctrl-v
vnoremap <C-c> "+yi
vnoremap <C-x> "+c
vnoremap <C-v> c<ESC>"+p
inoremap <C-v> <ESC>"+pa

"Switch buffers
nnoremap <leader>t :bn<cr>
nnoremap <leader>r :bp<cr>
nnoremap <C-w> gt
nnoremap <C-q> gT

"Surround word with brackets
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>`>ll
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>`>ll

"Work with vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"Put the last word written uppercase
inoremap <c-y> <esc>viwUea

noremap <silent> <C-h> :call WinMove('h')<cr>
noremap <silent> <C-j> :call WinMove('j')<cr>
noremap <silent> <C-k> :call WinMove('k')<cr>
noremap <silent> <C-l> :call WinMove('l')<cr>

nnoremap <silent> <leader>i :call ToggleIndent()<cr>

"Keys I want to stop using
inoremap <up>    <nop>
inoremap <left>  <nop>
inoremap <right> <nop>
inoremap <down>  <nop>
nnoremap <up>    <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
nnoremap <down>  <nop>

"Movement maps
"<c-u>normal! gets past having to start changing at cursor
"changes text inside next or current braces
onoremap p :<c-u>normal! f)vi(<cr>
onoremap " :<c-u>normal! f"vi"<cr>
onoremap ' :<c-u>normal! f'vi'<cr>
" }}}

" Abbreviations ----------- {{{
iabbrev fun function
" }}}

" Custom Java folding -------------- {{{
"augroup folds
"    autocmd!
"    autocmd BufEnter *.java set foldmethod=expr
"    autocmd BufEnter *.java set foldexpr=Fold(v:lnum)
"augroup END

let g:folding = 0
function! Fold(lineNumber)
    let line1 = getline(a:lineNumber)

    if line1 =~ '^\s\+}.*$'
        if g:folding == IndentLevel(a:lineNumber)
            let g:folding = 0
            return 1
        endif
    endif

    if line1 =~ '^\s\+public.*{$'
        let g:folding = IndentLevel(a:lineNumber)
        return 0
    endif

    if g:folding == 1
        return 1
    endif
    return 0
endfunction

function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction
" }}}

" Help functions -------------------- {{{
"
"Extract background color from environment variable
function! GetBackgroundColor()
    let l:path = $BASE16_SHELL

    " Getting filename from path
    let l:filename = split(l:path, "/")[-1]

    " Getting color from filename
    let l:background = split(l:filename, "\\.")[1]
    return l:background
endfunction

"Extract colortheme from environment variable
"function! GetColorTheme()
"    let l:path = $BASE16_SHELL
"    " Getting filename from path
"    let l:filename = split(l:path, "/")[-1]

    " Getting rid of the extension of the filename
"    let l:colortheme = split(l:filename, "\\.")[0]
"    return l:colortheme
"endfunction

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

"Toggle indent 2 and 4 spaces
function! ToggleIndent()
    if &tabstop == 2
        set tabstop=4
        set shiftwidth=4
        set softtabstop=4
        echo "indent=4"
    else
        set tabstop=2
        set shiftwidth=2
        set softtabstop=2
        echo "indent=2"
    endif
endfunction
" }}}

colorscheme gruvbox
set background=dark

augroup filetype
   au BufRead,BufNewFile *.flex,*.jflex    set filetype=jflex
augroup END
au Syntax jflex    so ~/.config/nvim/syntax/jflex.vim


"Load plugins from vim-plug
source ~/.config/nvim/plugins.vim
