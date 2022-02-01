return function()
  local map = require('core.utils').map
  map('n', '<leader>p', '<cmd>lua vim.lsp.buf.formatting()<cr>')
end
