return function()
  local map = require('core.utils').map

  require('nvim-tree').setup {}

  map('n', '<leader>n', ':NvimTreeToggle<cr>')
  map('n', '<leader>f', ':NvimTreeFindFile<cr>')
end
