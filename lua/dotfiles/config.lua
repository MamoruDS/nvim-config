local M = {}

local utils = require("dotfiles.utils")

M.default_opts = {
  appearances = {
    dark_mode = true,
    nerdfont = false,
    transparent_bg = false,
  },
  plugins = {
    load_tags = {
      positive = { "default" },
      negative = {},
    },
    extra_plugins = {
      -- ! tags field is required for per plugin
    },
    fuzzy_finder = "telescope", -- fzf-lua / telescope
  },
}

M.config = nil

function M.setup(opts)
  M.config = utils.mergeTables(M.default_opts, opts)
end

return M
