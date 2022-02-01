-- Line numbers
opt.number = true
opt.relativenumber = true

-- Searching
opt.ignorecase = true -- case insensitive searching
opt.hlsearch = true
opt.incsearch = true -- opt.incremental search, like modern browsers
opt.lazyredraw = false -- don't redraw while executing macros
opt.magic = true -- Set magic on, for regex

-- Line length
opt.colorcolumn = '81' -- Highlight the specified column
opt.wrap = true --turn on line wrapping
opt.linebreak = true -- set soft wrapping
opt.showbreak = '…' -- show ellipsis at breaking

-- Undo
opt.undodir = env.HOME.."/.cache/nvim/undo_dir"
opt.undofile = true

-- Misc
opt.cursorline = true -- Highlight current line
opt.showmatch = true -- show matching braces
opt.mat = 2 -- how many tenths of a second to blink
opt.so = 7 -- set 7 lines to the cursors - when moving vertical
opt.wildmenu = true -- enhanced command line completion
opt.hidden = true -- current buffer can be put into background
opt.wildmode = 'list:longest' -- complete files like a shell
opt.scrolloff = 3 -- lines of text around cursor
opt.shell = env.SHELL
opt.cmdheight = 1 -- command bar height
opt.exrc = true -- Forces vim to source .vimrc file if it is present in the working directory.
opt.secure = true -- Restrict usage of some commands for security
