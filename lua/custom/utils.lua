-- utils.lua

local M = {}

function M.OpenNvimTree()
  local current_file = vim.fn.expand('%')
  local current_directory = vim.fn.fnamemodify(current_file, ':h')
  require'nvim-tree'.find_file(true, current_directory)
end

function M.copy_buffer_path()
  local path = vim.fn.expand('%:p:h')
  vim.fn.setreg('+', path)
  vim.cmd('echo "Path copied to clipboard: " .. v:register')
end

-- see: https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
local lsp_formatters = {
  -- Add more language servers for formatting here
}

function M.filterd_format(bufnr)
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

function M.edit_snippets()
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

return M

