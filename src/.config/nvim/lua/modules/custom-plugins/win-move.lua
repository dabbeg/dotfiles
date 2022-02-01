--
-- Move to the window in the direction shown, or create a new split
--
local map = require('core.utils').map

function WinMove(key)
  local curwin = vim.api.nvim_call_function("winnr", {})
  cmd("wincmd "..key)

  -- If unmoved then we split
  local movedwin = vim.api.nvim_call_function("winnr", {})
  if (curwin == movedwin) then
    if string.find('j k', key) then
      cmd('wincmd s')
    else
      cmd('wincmd v')
    end
    cmd("wincmd "..key)
  end
end

map('n', '<c-h>', ':lua WinMove("h")<cr>')
map('n', '<c-j>', ':lua WinMove("j")<cr>')
map('n', '<c-k>', ':lua WinMove("k")<cr>')
map('n', '<c-l>', ':lua WinMove("l")<cr>')
