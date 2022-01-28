local lsp_installer_servers = require('nvim-lsp-installer.servers')

function setup(opts)
  -- Copied from https://github.com/williamboman/nvim-lsp-installer
  -- Loop through the servers listed above.
  for _, server_name in pairs(opts.servers) do
      local server_available, server = lsp_installer_servers.get_server(server_name)
      if server_available then
          server:on_ready(function ()
              -- When this particular server is ready (i.e. when installation is finished or the server is already installed),
              -- this function will be invoked. Make sure not to use the "catch-all" lsp_installer.on_server_ready()
              -- function to set up servers, to avoid doing setting up a server twice.
              local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
              local opts = { capabilities = capabilities }
              server:setup(opts)
          end)
          if not server:is_installed() then
              -- Queue the server to be installed.
              server:install()
          end
      end
  end
end

return {
  setup = setup,
}

