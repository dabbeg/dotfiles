--
-- Toggle indent 2 and 4 spaces
--
local map = require('core.utils').map
local indent = 2

opt.autoindent  = true
opt.smartindent = true
opt.expandtab   = true

opt.tabstop     = indent
opt.shiftwidth  = indent
opt.softtabstop = indent

function ToggleIndent()
  local tabstop = 2
  if vim.inspect(opt.tabstop:get()) == tostring(tabstop) then
    tabstop = 4
  end
  opt.tabstop = tabstop
  opt.shiftwidth = tabstop
  opt.softtabstop = tabstop
  print("indent="..tabstop)
end

map('n', '<leader>i', ':lua ToggleIndent()<cr>')
