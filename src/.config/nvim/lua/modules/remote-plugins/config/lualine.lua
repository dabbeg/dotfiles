return function()
  require('lualine').setup {
    options = { theme = 'ayu_mirage' },
    tabline = {
      lualine_a = {'buffers'},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {'tabs'}
    }
  }
end
