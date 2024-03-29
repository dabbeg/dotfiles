return function()
  local map = require('core.utils').map

  map('n', '<C-b>', ':Telescope buffers<cr>')
  map('n', '<C-p>', ':Telescope git_files<cr>')
  map('n', '<C-[>', ':Telescope lsp_references<cr>')
  map('n', '<C-]>', ':Telescope lsp_implementations<cr>')
  map('n', '<C-g>', ':Telescope live_grep<cr>')
  map('n', '<C-q>', ':Telescope resume<cr>')
  map('n', '<C-i>', '<cmd>lua vim.lsp.buf.hover()<cr>')
  require("telescope").setup {
    pickers = {
      live_grep = {
        additional_args = function(opts)
          return {"--hidden"}
        end
      },
    },
  }
end
