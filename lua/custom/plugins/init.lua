local overrides = require "custom.plugins.options.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.plugins.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    -- opts = overrides.nvimtree,
    opts = require "custom.plugins.options.nvimtree",
  },

  -- @! my override
  {
    "lewis6991/gitsigns.nvim",
    opts = require "custom.plugins.options.gitsigns",
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- @! my plugins
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  -- is this really needed (whiout this also .editorconfig works!)
  { "editorconfig/editorconfig-vim" },
  {
    "MunifTanjim/nui.nvim",
    lazy = false,
  },
  {
    "xeluxee/competitest.nvim",
    lazy = false,
    dependencies = {
      {
        "MunifTanjim/nui.nvim",
        config = function()
          require("custom.plugins.configs.competitest").setup()
        end,
      },
    },
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
}

return plugins
