local function conf(name)
  return require(string.format('modules.remote-plugins.config.%s', name))
end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'tpope/vim-fugitive'
  use 'tpope/vim-commentary'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = conf('nvim-tree')
  }

  use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
    ft = {'markdown'}
  }

  -- Nice colorscheme but having a hard time parting with base16
  -- use {
  --   'tjdevries/colorbuddy.vim',
  --   requires = { 'tjdevries/gruvbuddy.nvim' },
  --   config = function() require('colorbuddy').colorscheme('gruvbuddy') end
  -- }

  use {
    'norcalli/nvim-base16.lua',
    config = function()
      local base16 = require('base16')
      base16(base16.themes[env.BASE16_THEME or '3024'], true)
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = conf('nvim-treesitter')
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = conf('lualine')
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = conf('telescope')
  }

  -- TODO can I make the signs thicker?
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = conf('gitsigns')
  }

  -- LSP and completion
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use { 
    'hrsh7th/nvim-cmp',
    config = conf('nvim-cmp')
  }
  use {
    'neovim/nvim-lspconfig',
    after = {
      'mason.nvim',
      'mason-lspconfig.nvim',
      'cmp-nvim-lsp',
    },
    config = conf('nvim-lspconfig')
  }

  use {
    'sbdchd/neoformat',
    after = 'nvim-lspconfig', -- nvim-lspconfig maps <leader>p for other files
    config = function()
      cmd[[autocmd FileType javascript,typescript nnoremap <leader>p <Cmd>Neoformat<CR>]]
      g.neoformat_try_node_exe = 1
    end
  }
end)
