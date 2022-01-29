opt.exrc = true -- Forces vim to source .vimrc file if it is present in the working directory.
opt.secure = true -- Restrict usage of some commands for security

opt.number = true
opt.relativenumber = true

opt.so = 7 -- set 7 lines to the cursors - when moving vertical
opt.wildmenu = true -- enhanced command line completion
-- TODO fix opt.path+=** -- Appends recursive search to the end of path, try using :find
opt.hidden = true -- current buffer can be put into background
opt.wildmode = 'list:longest' -- complete files like a shell
opt.scrolloff = 3 -- lines of text around cursor
opt.shell = env.SHELL
opt.cmdheight = 1 -- command bar height

-- Searching
opt.ignorecase = true -- case insensitive searching
opt.hlsearch = true
opt.incsearch = true -- opt.incremental search, like modern browsers
opt.lazyredraw = false -- don't redraw while executing macros
opt.magic = true -- Set magic on, for regex

opt.showmatch = true -- show matching braces
opt.mat = 2 -- how many tenths of a second to blink

opt.colorcolumn = '81' -- Highlight the specified column
-- TODO fix highlight ColorColumn ctermbg=darkgray

opt.wrap = true --turn on line wrapping
opt.linebreak = true -- set soft wrapping
opt.showbreak = '…' -- show ellipsis at breaking

-- Undo
opt.undodir = env.HOME.."/.cache/nvim/undo_dir"
opt.undofile = true

opt.background = 'dark'

-- TODO fix syntax on
-- TODO fix let base16colorspace=256  --Access colors present in 256 colorspace

--Highlight current line
opt.cursorline = true
