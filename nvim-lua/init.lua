--
-- TODO Lua migration
-- * Fix all todos in vim-options
-- * Find a way to run prettier / lsp offers formatting not sure how good it is
--

cmd = vim.cmd
env = vim.env
opt = vim.opt
g   = vim.g

-- Core settings
require('core.utils')
require('core.options')
require('core.keymaps')

-- Plugins
require('modules.custom-plugins')
require('modules.remote-plugins')
