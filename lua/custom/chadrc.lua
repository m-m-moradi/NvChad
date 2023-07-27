---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },
  statusline = {
    separator_style = "block",
 },
  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

-- https://neovim.io/doc/user/api.html#nvim_set_keymap()
-- https://stackoverflow.com/questions/10956261/how-can-i-remap-the-vim-record-macro-key-from-q-to-q
vim.api.nvim_set_keymap('', '<Leader>q', 'q', { noremap = true })
vim.api.nvim_set_keymap('', 'q', '<Nop>', { noremap = true })

-- see this: https://superuser.com/questions/271023/can-i-disable-continuation-of-comments-to-the-next-line-in-vim
-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
-- https://stackoverflow.com/questions/16030639/vim-formatoptions-or/23326474#23326474

-- to know who is overriding the formation options (if this line be in init.lua then the ftplugin would override it)
-- :5verbose set fo?
-- :5verbose setl fo?
vim.opt.formatoptions:remove { "c", "r", "o" }

return M
