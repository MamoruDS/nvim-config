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

require("lazy").setup({
  {
    "numToStr/Comment.nvim",
    event = "BufEnter",
    config = function()
      utils.require("plugins.comment")
    end,
  },

  {
    "rcarriga/nvim-notify",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      utils.require("plugins.nvim-notify")
    end,
  },

  {
    "folke/noice.nvim",
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
    lazy = false,
    priority = 100,
    config = function()
      utils.require("plugins.github-theme")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "BufEnter",
    config = function()
      utils.require("plugins.lualine")
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
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
    cond = function()
      return vim.g.use_nerdfont
    end,
    config = function()
      utils.require("plugins.nvim-web-devicons")
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeOpen" },
    config = function()
      utils.require("plugins.nvim-tree")
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufEnter",
    config = function()
      utils.require("plugins.indent_blankline")
    end,
  },

  {
    "ojroques/vim-oscyank",
    branch = "main",
    config = function()
      utils.require("plugins.oscyank")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
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
    config = function()
      utils.require("plugins.fzf-lua")
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufEnter",
    config = function()
      utils.require("plugins.conform")
    end,
  },

  -- lsp

  {
    "neovim/nvim-lspconfig",
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
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      utils.require("plugins.nvim-cmp")
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
  },
})
