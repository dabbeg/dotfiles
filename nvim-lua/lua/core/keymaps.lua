local map = require('core.utils').map

-- set a map leader for more key combos
g.mapleader = ' '
g.maplocalleader = ' '

map('i', 'jk', '<ESC>') -- jk to ESC
map('n', '<C-s>', ':w<cr>') -- Save
map('n', '<leader>o', ':noh<cr>') -- Remove search highlighting

--Mapping Copy, Paste, Cut (ctrl-c, ctrl-x and ctrl-v)
map('v', '<C-c>', '"+y')
map('v', '<C-x>', '"+c<ESC>')
map('v', '<C-v>', 'c<ESC>"+p')
map('i', '<C-v>', '<ESC>"+pa')

-- Buffers
map('n', '<leader>t', ':enew<cr>') -- New buffer
map('n', '<leader>l', ':bnext<cr>') -- Next buffer
map('n', '<leader>h', ':bprevious<cr>') -- Previous buffer
map('n', '<leader>d', ':bp <BAR> bd #<CR>') -- Close buffer and open previous one

--Work with vimrc file
map('n', '<leader>ep', ':vsplit $HOME/.config/nvim/plugins.vim<cr>')
map('n', '<leader>ev', ':vsplit $MYVIMRC<cr>')
map('n', '<leader>sv', ':source $MYVIMRC<cr>')

--Put the last word written uppercase
map('i', '<c-y>sv', '<esc>viwUea')
