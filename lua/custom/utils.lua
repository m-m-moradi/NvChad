-- utils.lua

local M = {}

function M.OpenNvimTree()
  local current_file = vim.fn.expand('%')
  local current_directory = vim.fn.fnamemodify(current_file, ':h')
  require'nvim-tree'.find_file(true, current_directory)
end

return M
