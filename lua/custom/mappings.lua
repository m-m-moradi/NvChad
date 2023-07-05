local lsp_formatters = {
  -- Add more language servers for formatting here
}

-- see: https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
local filterd_format = function(bufnr)
  vim.lsp.buf.format {
    filter = function(client)
      local client_name = client.name or ""
      if vim.tbl_contains(lsp_formatters, client_name) then
        return true
      else
        return client_name == "null-ls"
      end
    end,
    bufnr = bufnr,
    async = true,
  }
end

local edit_snippets = function()
  require("luasnip.loaders").edit_snippet_files {
    edit = function(file)
      vim.cmd("vsp " .. file)
    end,
    extend = function(ft, paths)
      -- see: https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#edit_snippets
      -- label (appear in selection prompt), path that will passed to edit()
      local snippets_file = string.format("%s/%s.snippets", vim.g.snipmate_snippets_path, ft)
      local json_file = string.format("%s/%s.json", vim.g.vscode_snippets_path, ft)
      local lua_file = string.format("%s/%s.lua", vim.g.lua_snippets_path, ft)
      local new_paths = {}

      local files = {
        { "$CONFIG/" .. ft .. ".snippets", snippets_file },
        { "$CONFIG/" .. ft .. ".json", json_file },
        { "$CONFIG/" .. ft .. ".lua", lua_file },
      }

      for _, file in ipairs(files) do
        local label, path = file[1], file[2]
        if not vim.tbl_contains(paths, path) then
          table.insert(new_paths, { label, path })
        end
      end

      return new_paths
    end,
  }
end

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
    ["<leader>fm"] = { function() filterd_format() end, "LSP formatting" },
    ["<leader>wa"] = { function() vim.lsp.buf.add_workspace_folder() end, "Add workspace folder" },
    ["<leader>wr"] = { function() vim.lsp.buf.remove_workspace_folder() end, "Remove workspace folder" },
    ["<leader>wl"] = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "List workspace folders" },
    -- my mappings
    ["<leader>df"] = { function() vim.diagnostic.open_float { border = "rounded" } end, "Floating diagnostic" },
    ["<leader>ic"] = { function() vim.lsp.buf.incoming_calls() end, "LSP incoming calls" },
    ["<leader>oc"] = { function() vim.lsp.buf.outgoing_calls() end, "LSP outgoing calls" },
    ["<leader>es"] = { function() edit_snippets() end , "edit snippet" },
    ["<leader>sp"] = { ":lua print(vim.fn.bufname())<CR>", "show path" },
    -- stylua: ignore end
  },
  v = {
    -- my mappings
    -- stylua: ignore start
    ["<leader>fm"] = { function() filterd_format() end, "LSP range formatting" },
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
