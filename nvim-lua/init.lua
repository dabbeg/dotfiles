--
-- TODO Lua migration
-- * Fix all todos in vim-options
-- * Find a way to run prettier / lsp offers formatting not sure how good it is
-- * Fix terraform syntax highlighting and linting
--

-- Vim options and mappings
require('util')
require('vim-options')
require('mappings')

-- Custom plugins
require('custom-plugins.win-move')
require('custom-plugins.toggle-indent')
require('custom-plugins.open-unstaged')

-- Load all plugins
require('plugins')
