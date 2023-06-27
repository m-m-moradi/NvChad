---@type MappingsTable
local M = {}

M.general = {
  -- n = {
  --   [";"] = { ":", "enter command mode", opts = { nowait = true } },
  -- },
}

-- more keybinds!
M.disabled = {
  n = {
    ["<leader>h"] = "",
    ["<leader>f"] = "",
    ["<leader>uu"] = "",
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


M.lspconfig = {
  plugin = true,
  n = {
    ["gD"] = {function() vim.lsp.buf.declaration() end, "   lsp declaration"},
    ["gd"] = {function() vim.lsp.buf.definition() end, "   lsp definition"},
    ["gi"] = {
      function() vim.lsp.buf.implementation() end,
      "   lsp implementation"
    },
    ["gr"] = {function() vim.lsp.buf.references() end, "   lsp references"},
    ["K"] = {function() vim.lsp.buf.hover() end, "   lsp hover"},
    ["[d"] = {function() vim.diagnostic.goto_prev() end, "   goto prev"},
    ["]d"] = {function() vim.diagnostic.goto_next() end, "   goto_next"},
    ["<leader>D"] = {
      function() vim.lsp.buf.type_definition() end,
      "   lsp definition type"
    },
    ["<leader>q"] = {
      function() vim.diagnostic.setloclist() end,
      "   diagnostic setloclist"
    },
    ["<leader>ic"] = {
      function() vim.lsp.buf.incoming_calls() end,
      "   lsp incoming calls"
    },
    ["<leader>oc"] = {
      function() vim.lsp.buf.outgoing_calls() end,
      "   lsp outgoing calls"
    },
    ["<leader>ls"] = {
      function() vim.lsp.buf.signature_help() end,
      "   lsp signature_help"
    },
    ["<leader>ra"] = {
      function() require("nvchad.ui.renamer").open() end,
      "   lsp rename"
    },
    ["<leader>ca"] = {
      function() vim.lsp.buf.code_action() end,
      "   lsp code_action"
    },
    ["<leader>df"] = {
      function() vim.diagnostic.open_float() end,
      "   floating diagnostic"
    },
    ["<leader>fm"] = {
      function() vim.lsp.buf.formatting() end,
      "   lsp formatting"
    },
    ["<leader>wa"] = {
      function() vim.lsp.buf.add_workspace_folder() end,
      "   add workspace folder"
    },
    ["<leader>wr"] = {
      function() vim.lsp.buf.remove_workspace_folder() end,
      "   remove workspace folder"
    },
    ["<leader>wl"] = {
      function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
      "   list workspace folders"
    }
  },
  v = {
    ["<leader>fm"] = {
      function() vim.lsp.buf.range_formatting() end,
      "   lsp range formatting"
    }
  }
}

return M
