local M = {}

local utils = require("dotfiles.utils")

M.default_opts = {
  copilot = {
    enabled = false,
  },
  fuzzy_finder = "telescope", -- fzf-lua / telescope
}

M.config = nil

function M.setup(opts)
  M.config = utils.mergeTables(M.default_opts, opts)
end

return M
