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
  local author = vim.fn.trim(vim.fn.system "git config user.name")
  local email = vim.fn.trim(vim.fn.system "git config user.email")
  -- local github = vim.fn.trim(vim.fn.system('git config --get remote.origin.url'))

  vim.g.snips_author = author
  vim.g.snips_email = email
  -- vim.g.snips_github = github
end

-- Call the function to populate the variables
get_git_info()

-- [[ Plugin: slime ]] --
vim.g.slime_target = "tmux"
vim.g.slime_bracketed_paste = 1
-- vim.g.slime_cell_delimiter = "^\\s*##"
vim.g.slime_cell_delimiter = "# %%"
vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
vim.g.slime_cells_highlight_from = "SlimeCell"
vim.g.slime_dont_ask_default = 1
vim.g.slime_no_mappings = 1



-- vim.cmd([[
--   augroup markdown_highlight
--     autocmd!
--     autocmd FileType markdown highlight MarkdownList ctermbg=red guibg=red if getline('.') ==# '^\\s*! '
--   augroup END
-- ]])
