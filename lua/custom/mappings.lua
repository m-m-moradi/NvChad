local utils = require "custom.utils"

local M = {}

M.general = {
  n = {
    -- copied from core/mappings
    -- stylua: ignore start
    ["gD"]         = { function() vim.lsp.buf.declaration() end, "LSP declaration" },
    ["gd"]         = { function() vim.lsp.buf.definition() end, "LSP definition" },
    ["K"]          = { function() vim.lsp.buf.hover() end, "LSP hover" },
    ["gi"]         = { function() vim.lsp.buf.implementation() end, "LSP implementation" },
    ["<leader>ls"] = { function() vim.lsp.buf.signature_help() end, "LSP signature help" },
    ["<leader>D"]  = { function() vim.lsp.buf.type_definition() end, "LSP definition type" },
    ["<leader>ra"] = { function() require("nvchad_ui.renamer").open() end, "LSP rename" },
    ["<leader>ca"] = { function() vim.lsp.buf.code_action() end, "LSP code action" },
    ["gr"]         = { function() vim.lsp.buf.references() end, "LSP references" },
    ["<leader>f"]  = { function() vim.diagnostic.open_float { border = "rounded" } end, "Floating diagnostic" },
    ["[d"]         = { function() vim.diagnostic.goto_prev { float = { border = "rounded" } } end, "Goto prev" },
    ["]d"]         = { function() vim.diagnostic.goto_next { float = { border = "rounded" } } end, "Goto next" },
    ["<leader>q"]  = { function() vim.diagnostic.setloclist() end, "Diagnostic setloclist" },
    ["<leader>fm"] = { function() utils.filterd_format() end, "LSP formatting" },
    ["<leader>wa"] = { function() vim.lsp.buf.add_workspace_folder() end, "Add workspace folder" },
    ["<leader>wr"] = { function() vim.lsp.buf.remove_workspace_folder() end, "Remove workspace folder" },
    ["<leader>wl"] = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "List workspace folders" },
    -- my mappings
    ["<leader>df"] = { function() vim.diagnostic.open_float { border = "rounded" } end, "Floating diagnostic" },
    ["<leader>ic"] = { function() vim.lsp.buf.incoming_calls() end, "LSP incoming calls" },
    ["<leader>oc"] = { function() vim.lsp.buf.outgoing_calls() end, "LSP outgoing calls" },
    ["<leader>es"] = { function() utils.edit_snippets() end , "edit snippet" },
    ["<leader>sp"] = { ":lua print(vim.fn.bufname())<CR>", "show path" },
    ["<leader>cp"] = { function() utils.copy_buffer_path() end, "show path" ,opts = { noremap = true, silent = true }},
    -- stylua: ignore end
    ["<leader>X"] = { ":%bd|e#<CR>", "close all buffers excpet this one" },
  },
  v = {
    -- my mappings
    -- stylua: ignore start
    ["<leader>fm"] = { function() utils.filterd_format() end, "LSP range formatting" },
    -- stylua: ignore end
  },
}

-- more keybinds!
M.disabled = {
  i = {
    -- conflict with tmux-navigator
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
  },

  n = {
    ["<leader>h"] = "", -- new horizantal terminal (nvterm)
    ["<leader>v"] = "", -- new vertial terminal (nvterm)
    ["<leader>f"] = "", -- open_float (LSP - diagnostic)
    -- conflict with tmux-navigator
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
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
      -- "toggle comment",
    },
  },
  v = {
    ["<C-_>"] = {
      -- this is similar to what is in core/mapping
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}

M.lspconfig = {
  plugin = true,
  n = {},
  v = {},
}

M.nvimtree = {
  n = {
    ["<leader>tg"] = { ":lua require('custom.utils').OpenNvimTree()<CR>", "nvimtree go to file" },
  },
}

M.slime = {
  n = {
    ["<leader>s"] = { "<Plug>SlimeSendCell", "send cell" },
    -- ["<leader>s"] = { "<Plug>SlimeCellsSendAndGoToNext", "send and go to next cell" },
    ["<M-j>"] = { "<Plug>SlimeCellsNext", "next cell" },
    ["<M-k>"] = { "<Plug>SlimeCellsPrev", "prev cell" },
  },
}

M.flash = {
  n = {
    ["s"] = {
      function()
        require("flash").jump {
          search = {
            mode = function(str)
              return "\\<" .. str
            end,
          },
        }
      end,
      "flash jump",
    },
  },
  x = {
    ["s"] = {
      function()
        require("flash").jump {
          search = {
            mode = function(str)
              return "\\<" .. str
            end,
          },
        }
      end,
      "flash jump",
    },
  },
  o = {
    ["s"] = {
      function()
        require("flash").jump {
          search = {
            mode = function(str)
              return "\\<" .. str
            end,
          },
        }
      end,
      "flash jump",
    },
  },
}

return M
