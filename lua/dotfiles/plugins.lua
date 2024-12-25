local M = {}

local config = require("dotfiles.config").config
local utils = require("dotfiles.utils")

M.plugins = {
  {
    "numToStr/Comment.nvim",
    tags = { "default", "utils" },
    event = "BufEnter",
    config = function()
      utils.require("plugins.comment")
    end,
  },

  {
    "rcarriga/nvim-notify",
    tags = { "default", "no-vscode", "tui" },
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      utils.require("plugins.nvim-notify")
    end,
  },

  {
    "folke/noice.nvim",
    tags = { "default", "no-vscode", "tui" },
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      -- "rcarriga/nvim-notify",
    },
    config = function()
      utils.require("plugins.noice")
    end,
  },

  {
    "projekt0n/github-nvim-theme",
    tags = { "default", "no-vscode", "tui" },
    lazy = false,
    priority = 100,
    config = function()
      utils.require("plugins.github-theme")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    tags = { "default", "no-vscode", "tui" },
    event = "BufEnter",
    config = function()
      utils.require("plugins.lualine")
    end,
  },

  {
    "monaqa/dial.nvim",
    tags = { "default", "utils" },
    event = "VeryLazy",
  },

  {
    "lewis6991/gitsigns.nvim",
    tags = { "default", "no-vscode", "tui" },
    event = "BufRead",
    cond = function()
      return vim.wo.diff ~= true
    end,
    config = function()
      utils.require("plugins.gitsigns")
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
    tags = { "default", "no-vscode", "tui" },
    cond = function()
      return config.appearances.nerdfont
    end,
    config = function()
      utils.require("plugins.nvim-web-devicons")
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    tags = { "default", "no-vscode", "tui" },
    cmd = { "NvimTreeToggle", "NvimTreeOpen" },
    config = function()
      utils.require("plugins.nvim-tree")
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    tags = { "default", "no-vscode", "tui" },
    event = "BufEnter",
    config = function()
      utils.require("plugins.indent_blankline")
    end,
  },

  {
    "ojroques/vim-oscyank",
    tags = { "default", "utils" },
    branch = "main",
    config = function()
      utils.require("plugins.oscyank")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    tags = { "default", "no-native" },
    build = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
    config = function()
      utils.require("plugins.nvim-treesitter")
    end,
  },

  {
    "folke/which-key.nvim",
    tags = { "default", "no-vscode", "tui" },
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      utils.require("plugins.which-key")
    end,
  },

  {
    "ibhagwan/fzf-lua",
    tags = { "default", "no-vscode", "tui" },
    enabled = config.plugins.fuzzy_finder == "fzf-lua",
    config = function()
      utils.require("plugins.fzf-lua")
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    tags = { "default", "utils" },
    version = "v2.*",
    event = "VeryLazy",
  },

  {
    "stevearc/conform.nvim",
    tags = { "default", "lsp", "no-vscode" },
    event = "BufEnter",
    config = function()
      utils.require("plugins.conform")
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    tags = { "default", "no-vscode", "tui" },
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    enabled = config.plugins.fuzzy_finder == "telescope",
    config = function()
      utils.require("plugins.telescope")
    end,
  },

  {
    "sindrets/diffview.nvim",
    tags = { "default", "no-vscode", "tui" },
  },

  {
    "romgrk/barbar.nvim",
    tags = { "default", "tui" },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    config = function()
      utils.require("plugins.barbar")
    end,
  },

  {
    "tpope/vim-fugitive",
    tags = { "default" },
    config = function()
      utils.require("plugins.fugitive")
    end,
  },

  -- lsp

  {
    "neovim/nvim-lspconfig",
    tags = { "default", "lsp", "no-vscode" },
    config = function()
      utils.require("plugins.lsp_config")
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    tags = { "default" },
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      utils.require("plugins.nvim-cmp")
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    tags = { "default" },
    version = "^4",
    ft = { "rust" },
  },
}

local function filter_plugin(plugin, pos_tags, neg_tags)
  local isLoad = false
  if plugin.tags then
    for _, tag in ipairs(plugin.tags) do
      if utils.table_has(neg_tags, tag) then
        isLoad = false
        break
      end
      if utils.table_has(pos_tags, tag) then
        isLoad = true
      end
    end
    return isLoad
  end
  vim.notify("Field tags is missing for plugin " .. plugin[1] .. ", skipping ...", vim.log.levels.ERROR)
  return false
end

function M.load_plugins(plugins, extra_plugins, pos_tags, neg_tags)
  local lazy = require("dotfiles.plugins.lazy")
  lazy.bootstrap()
  local loads = {}
  for _, plugin in ipairs(plugins) do
    if filter_plugin(plugin, pos_tags, neg_tags) then
      table.insert(loads, plugin)
    end
  end
  for _, plugin in ipairs(extra_plugins) do
    if filter_plugin(plugin, pos_tags, neg_tags) then
      table.insert(loads, plugin)
    end
  end
  lazy.setup(loads)
end

function M.setup()
  M.load_plugins(
    M.plugins,
    config.plugins.extra_plugins,
    config.plugins.load_tags.positive,
    config.plugins.load_tags.negative
  )
end

return M
