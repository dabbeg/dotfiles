local function conf(name)
  return require(string.format('modules.remote-plugins.config.%s', name))
end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'tpope/vim-commentary'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = conf('nvim-tree')
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
    'neovim/nvim-lspconfig',
    config = conf('nvim-lspconfig')
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use { 
    'hrsh7th/nvim-cmp',
    config = conf('nvim-cmp')
  }
  use {
    'williamboman/nvim-lsp-installer',
    requires = { 'hrsh7th/cmp-nvim-lsp' },
    config = conf('nvim-lsp-installer').setup {
      servers = {
        'bashls',
        'cmake',
        'dockerls',
        'jdtls',
        'pyright',
        'terraformls',
        'tsserver',
      },
    }
  }
end)


-- " Ale {{{
-- " Plug 'w0rp/ale'
-- " let g:airline#extensions#ale#enabled = 1
-- " let g:ale_python_mypy_options = '--strict'
-- " let g:ale_python_black_options = '--line-length 79 --py38'
-- " let g:ale_linters = {
-- " \   'javascript': ['eslint'],
-- " \   'typescript': [],
-- " \   'python': ['flake8', 'mypy'],
-- " \   'markdown': ['prettier', 'write-good']
-- " \}
-- " let g:ale_fixers = {
-- " \   '*': ['remove_trailing_lines', 'trim_whitespace'],
-- " \   'javascript': ['prettier'],
-- " \   'typescript': ['prettier'],
-- " \   'css': ['prettier'],
-- " \   'scss': ['prettier'],
-- " \   'python': ['black'],
-- " \   'markdown': ['prettier'],
-- " \   'terraform': ['terraform']
-- " \}

-- " " Because prettier is used for typescript as well we need to use this
-- " " to only apply these options to prettier when viewing markdown files
-- " let g:ale_pattern_options_enabled = 1
-- " let g:ale_pattern_options = {
-- " \ '\.md$': {'ale_javascript_prettier_options': '--parser markdown --prose-wrap always --print-width 79'},
-- " \ '\.css$': {'ale_javascript_prettier_options': '--parser css'},
-- " \ '\.scss$': {'ale_javascript_prettier_options': '--parser scss'}
-- " \}

-- " nmap <silent> <leader>p :ALEFix<cr>
-- " }}}

-- " vim-fugitive {{{
-- Plug 'tpope/vim-fugitive'
-- " }}}

-- " vim-test {{{
-- " Plug 'janko-m/vim-test', { 'for': ['javascript'] }
-- " }}}

-- " Prettier {{{
-- "Plug 'prettier/vim-prettier'
-- " }}}
