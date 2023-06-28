-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
    bold = true,
  },
  -- https://flatuicolors.com/palette/us
  NvimTreeGitNew = {fg = "#55efc4"},
  NvimTreeGitDirty = {fg = "#fd79a8"},
  -- NvimTreeGitStaged = {fg = "#ffeaa7"},
  NvimTreeGitMerge = {fg = "#74b9ff"},
  NvimTreeGitDeleted = {fg = "#ff7675"}
  -- NvimTreeGitRenamed = {fg="#2ecc71"},
  -- NvimTreeGitIgnored = {fg="#2ecc71"},
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
  Sneak = {fg = "#000000", bg = "#95a5a6"},
  NvimTreeGitStaged = {fg = "#ffeaa7"}
}

return M
