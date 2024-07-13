local M = {}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local utils = require("dotfiles.utils")
local config = require("dotfiles.config").config

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
      return vim.g.use_nerdfont
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
    tags = { "default" },
    build = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
    config = function()
      utils.require("plugins.nvim-treesitter")
    end,
  },

  {
    "github/copilot.vim",
    tags = { "default", "ai", "no-vscode" },
    enabled = config.copilot.enabled,
    event = "InsertEnter",
    cond = function()
      return ((vim.fn.executable("node") == 1) or (vim.fn.empty(vim.g.copilot_node_command) == 0))
        and vim.wo.diff ~= true
    end,
    init = function()
      utils.require("plugins.copilot")
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

  -- lsp

  {
    "neovim/nvim-lspconfig",
    tags = { "default", "lsp", "no-vscode" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
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

function M.load_plugins(plugins, pos_tags, neg_tags)
  local loads = {}
  for _, plugin in ipairs(plugins) do
    local load = false
    for _, tag in ipairs(plugin.tags) do
      if utils.isInTable(neg_tags, tag) then
        load = false
        break
      end
      if utils.isInTable(pos_tags, tag) then
        load = true
      end
    end
    if load then
      table.insert(loads, plugin)
    end
  end
  require("lazy").setup(loads)
end

M.default_opts = {
  tags = {
    positive = { "default" },
    negative = {},
  },
}

function M.setup(opts)
  opts = utils.mergeTables(M.default_opts, opts)
  M.load_plugins(M.plugins, opts.tags.positive, opts.tags.negative)
end

return M
