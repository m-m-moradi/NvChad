local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
-- note: lua_ls is configured at lua/plugins/configs/lspconfig.lua. other ones must be included in here to use,
-- this is different than installing via Mason

local servers = { 
  "html", 
  "cssls", 
  "tsserver", 
  "clangd", 
  "pyright" 
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Without the loop, you would have to manually set up each LSP 
-- 
-- lspconfig.html.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
--
-- lspconfig.cssls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

--
-- lspconfig.pyright.setup { blabla}


-- this setting must be loaded after the deafault configs for ui stuff for lsp.
-- see this file for more info: https://github.com/NvChad/ui/blob/v2.0/lua/nvchad_ui/lsp.lua
-- if the nvchad_ui plugin get updated probably this settings must be changed.

-- see :help vim.diagnostic.config() for more info
vim.diagnostic.config {
  virtual_text = false,
  float = { source = "always", border = "rounded" },
  signs = true,
  underline = true,
  update_in_insert = false,
}
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
  focusable = false,
  relative = "cursor",
})

-- this code just change the win.border to "rounded" and leave the rest config as default.
local win = require "lspconfig.ui.windows"
local _default_opts = win.default_opts
win.default_opts = function(options)
  local opts = _default_opts(options)
  opts.border = "rounded"
  return opts
end
