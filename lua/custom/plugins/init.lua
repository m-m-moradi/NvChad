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
    opts = require "custom.plugins.options.mason",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "custom.plugins.options.treesitter",
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require "custom.plugins.options.nvimtree",
  },

  -- @! my override
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      -- opts = require "custom.plugins.options.treesitter",
    },
  },

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
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  -- {
  --   "jpalardy/vim-slime",
  --   lazy = false,
  -- },
  {
    "klafyvel/vim-slime-cells",
    lazy = false,
    dependencies = {
      "jpalardy/vim-slime",
      lazy = false,
    },
  },

  {
    "NvChad/nvim-colorizer.lua",
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
      require("custom.plugins.configs.flash").setup()
    end,
  },
  {
    "mfussenegger/nvim-dap",
    lazy = false,
  },
  {
    "mfussenegger/nvim-dap-python",
    lazy = false,
  },
  {
    -- change it with this -> https://github.com/stevearc/aerial.nvim
    "simrat39/symbols-outline.nvim",
    opts = require("custom.plugins.options.outline"),
    lazy = false,
  },
}

return plugins
