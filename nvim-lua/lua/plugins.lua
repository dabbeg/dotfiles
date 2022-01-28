
return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'tpope/vim-commentary'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup {}
      map('n', '<leader>n', ':NvimTreeToggle<cr>')
      map('n', '<leader>f', ':NvimTreeFindFile<cr>')
    end
  }

  use {
    'tjdevries/colorbuddy.vim',
    requires = { 'tjdevries/gruvbuddy.nvim' },
    config = function() require('colorbuddy').colorscheme('gruvbuddy') end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate', -- On first setup we need to run :TSInstall maintained
    config = function() require('nvim-treesitter.configs').setup {} end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function() require('lualine').setup {
      options = { theme = 'ayu_mirage' },
      tabline = {
        lualine_a = {'buffers'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'tabs'}
      }
    } end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      map('n', '<C-b>', ':Telescope buffers<cr>')
      map('n', '<C-p>', ':Telescope git_files<cr>')
      map('n', '<C-[>', ':Telescope lsp_references<cr>')
      map('n', '<C-]>', ':Telescope lsp_implementations<cr>')
      map('n', '<C-g>', ':Telescope live_grep<cr>')
      map('n', '<C-i>', '<cmd>lua vim.lsp.buf.hover()<cr>')
    end
  }

  -- TODO can I make the signs thicker?
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  -- LSP and completion
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use { 
    'hrsh7th/nvim-cmp',
    config = function () require('plugin-config.nvim-cmp').setup {} end
  }
  use {
    'williamboman/nvim-lsp-installer',
    requires = { 'hrsh7th/cmp-nvim-lsp' },
    config = function() require('plugin-config.nvim-lsp-installer').setup {
      servers = {
        'bashls',
        'cmake',
        'dockerls',
        'jdtls',
        'pyright',
        'terraformls',
        'tsserver',
      },
    } end
  }
end)


-- Plug 'chrisbra/unicode.vim'

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

-- " React {{{
-- " Plug 'pangloss/vim-javascript'
-- " Plug 'mxw/vim-jsx'
-- " Plug 'peitalin/vim-jsx-typescript'
-- " Plug 'HerringtonDarkholme/yats.vim'
-- "Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
-- " }}}

-- " vim-test {{{
-- " Plug 'janko-m/vim-test', { 'for': ['javascript'] }
-- " }}}

-- " Colorscheme {{{
-- Plug 'chriskempson/base16-vim'
-- " }}}

-- " vim-surround {{{
-- " Plug 'tpope/vim-surround'
-- " }}}

-- " vim-gitgutter {{{
-- Plug 'airblade/vim-gitgutter'
-- set updatetime=100
-- let g:gitgutter_map_keys = 0

-- " Always show signcolumn
-- if exists('&signcolumn')  " Vim 7.4.2201
--   set signcolumn=yes
-- else
--   let g:gitgutter_sign_column_always = 1
-- endif

-- " Prettier {{{
-- "Plug 'prettier/vim-prettier'
-- " }}}

-- " vim-terraform {{{
-- " Plug 'hashivim/vim-terraform'
-- " }}}

-- " This needs to be run after plug#end() so that base16-vim has loaded
-- if filereadable(expand("~/.vimrc_background"))
--     let base16colorspace=256
--     source ~/.vimrc_background
-- endif
