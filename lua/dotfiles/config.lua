local M = {}

local utils = require("dotfiles.utils")

M.default_opts = {
  copilot = {
    enabled = false,
  },
}

M.config = nil

function M.setup(opts)
  M.config = utils.mergeTables(M.default_opts, opts)
end

return M
