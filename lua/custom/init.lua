-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--

-- vscode format i.e json files
vim.g.vscode_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snips/vscode"
-- snipmate format
vim.g.snipmate_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snips/snippets"
-- lua format
vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snips/luasnippets"


local function get_git_info()
  local author = vim.fn.trim(vim.fn.system('git config user.name'))
  local email = vim.fn.trim(vim.fn.system('git config user.email'))
  -- local github = vim.fn.trim(vim.fn.system('git config --get remote.origin.url'))

  vim.g.snips_author = author
  vim.g.snips_email = email
  -- vim.g.snips_github = github
end

-- Call the function to populate the variables
get_git_info()
