return function()
  local map = require('core.utils').map
  map('n', '<leader>p', '<cmd>lua vim.lsp.buf.formatting()<cr>')

  require('mason').setup()

  require('mason-lspconfig').setup({
    ensure_installed = {
      'bashls',
      'cmake',
      'dockerls',
      'jdtls',
      'pyright',
      'solargraph',
      'terraformls',
      'tsserver',
    }
  })
  require('mason-lspconfig').setup_handlers {
    function (server_name)
      local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
      require("lspconfig")[server_name].setup {
        capabilities = capabilities
      }
    end,
  }
end
