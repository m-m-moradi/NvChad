---@type MappingsTable
local M = {}

M.general = {}

-- more keybinds!
M.disabled = {
  n = {
    ["<leader>h"] = "", -- new horizantal terminal (nvterm)
    ["<leader>v"] = "", -- new vertial terminal (nvterm)
    ["<leader>f"] = "", -- open_float (LSP - diagnostic)
  },
}

M.competitest = {
  -- plugin = true,
  n = {
    ["<leader>tr"] = { ":CompetiTestRun <CR>", "competitest test cases run" },
    ["<leader>ts"] = { ":CompetiTestRunNE <CR>", "competitest test cases show" },
  },
}

M.comment = {
  -- toggle comment in both modes
  -- plugin = true,
  n = {
    ["<C-_>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },
  v = {
    ["<C-_>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}

-- other keybinds that are defined in core/mappings
-- gD goto declaration (buf)
-- gd goto definition (buf)
-- gi goto implementation (buf)
-- gr goto references (buf)
-- [d goto prev (diagnostic)
-- ]d goto next (diagnostic)
-- K  LPS hover
-- <leader>D  type_definition (buf)
-- <leader>q  setloclist (diagnostic)
-- <leader>ls signature_help(buf)
-- <leader>ra rename (nvchad.ui)
-- <leader>ca code_action (buf)
-- <leader>f open_float (diagnostic) @@@ different
-- <leader>wa add_workspace_folder (buf)
-- <leader>wr remove_workspace_folder (buf)
-- <leader>wl list_workspace_folders (buf)
M.lspconfig = {
  n = {
    ["<leader>dff"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },
    ["<leader>ic"] = {
      function()
        vim.lsp.buf.incoming_calls()
      end,
      "LSP incoming calls",
    },
    ["<leader>oc"] = {
      function()
        vim.lsp.buf.outgoing_calls()
      end,
      "LSP outgoing calls",
    },
  },
  v = {
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.range_formatting()
      end,
      "LSP range formatting",
    },
  },
}

return M
