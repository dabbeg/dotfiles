" Basic Settings --------- {{{
set exrc "Forces vim to source .vimrc file if it is present in the working directory.
set secure "Restrict usage of some commands for security

set number
set relativenumber

set so=7 " set 7 lines to the cursors - when moving vertical
set wildmenu " enhanced command line completion
set path+=** " Appends recursive search to the end of path, try using :find
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
set colorcolumn=81
highlight ColorColumn ctermbg=darkgray

set wrap "turn on line wrapping
"set wrapmargin=8 " wrap lines when coming within n characters from side
set linebreak " set soft wrapping
set showbreak=… " show ellipsis at breaking
"set list listchars=trail:· "Though this is awesome it makes Makefiles show ^I

"Indent
set autoindent " automatically set indent of new line
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" }}}

" Apperance {{{
"colorscheme gruvbox
set background=dark

syntax on
let base16colorspace=256  "Access colors present in 256 colorspace

"Highlight current line
set cursorline

"Make current linenumber yellow
hi CursorLineNR ctermfg=yellow
" }}}

" Latex {{{
autocmd! BufWritePost *.tex !pdflatex %
" }}}

" FileType Settings ------------------------ {{{
augroup filetype_vim
    autocmd!
    "autocmd FileType vim nnoremap <localleader>c I"<esc>
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_python
    autocmd!
    "autocmd FileType python nnoremap <localleader>c I#<esc>
augroup END

augroup filetype_javascript
    autocmd!
    "autocmd FileType javascript nnoremap <localleader>c I//<esc>
    autocmd FileType javascript iabbrev <buffer> iff if()<left>
augroup END

augroup filetype_bash
    autocmd!
    autocmd FileType sh iabbrev <buffer> iff if []; then
augroup END

augroup filetype
   au BufRead,BufNewFile *.flex,*.jflex    set filetype=jflex
augroup END
au Syntax jflex    so ~/.config/nvim/syntax/jflex.vim
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
noremap <leader>o :noh<cr>

"Mapping ctrl-c, ctrl-x and ctrl-v
vnoremap <C-c> "+y
vnoremap <C-x> "+c<ESC>
vnoremap <C-v> c<ESC>"+p
inoremap <C-v> <ESC>"+pa

" Buffers
" To open a new empty buffer
nmap <leader>t :enew<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
nmap <leader>d :bp <BAR> bd #<CR>

" Tabs
nnoremap <C-w> gt
nnoremap <C-q> gT

" Opposite of <S-j>
nnoremap <S-k> f,a<CR><ESC>l

"Surround word with brackets
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>hbi{<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>hbi[<esc>lel
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>`>ll
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>`>ll
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>`>ll
vnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>`>ll
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>`>ll

"Work with vimrc file
nnoremap <leader>ep :vsplit $HOME/.config/nvim/plugins.vim<cr>
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
inoremap <up>     <nop>
inoremap <left>   <nop>
inoremap <right>  <nop>
inoremap <down>   <nop>
nnoremap <up>     <nop>
nnoremap <left>   <nop>
nnoremap <right>  <nop>
nnoremap <down>   <nop>
inoremap <S-up>   <nop>
inoremap <S-down> <nop>
nnoremap <S-up>   <nop>
nnoremap <S-down> <nop>


"Movement maps
"<c-u>normal! gets past having to start changing at cursor
"changes text inside next or current braces
"try typing dp in a line where there are parens
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

" Let's save undo info! -------------------- {{{
let nvim_dir = $HOME."/.config/nvim"
if !isdirectory(nvim_dir)
    call mkdir(nvim_dir, "", 0770)
endif

let undo_dir = nvim_dir."/undo-dir"
if !isdirectory(undo_dir)
    call mkdir(undo_dir, "", 0700)
endif

let &undodir=undo_dir
set undofile
" }}}

" Open git unstaged files {{{
nnoremap <leader>u :call OpenUnstaged()<cr>
function! OpenUnstaged()
    let unstaged = system("git status --short | awk '{print $2}'")
    for file in split(unstaged)
        execute 'edit' file
    endfor
endfunction
" }}}

"Load plugins from vim-plug
source ~/.config/nvim/plugins.vim
