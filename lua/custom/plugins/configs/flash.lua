local flash = require "flash"
-- https://github.com/folke/flash.nvim/discussions/36
local M = {}
M.setup = function()
  flash.setup {
    modes = {
      -- options used when flash is activated through
      -- a regular search with `/` or `?`
      search = {
        enabled = false, -- enable flash for search
      },
      -- options used when flash is activated through
      -- `f`, `F`, `t`, `T`, `;` and `,` motions
      char = {
        enabled = false,
      },
    },
  }
end

return M
