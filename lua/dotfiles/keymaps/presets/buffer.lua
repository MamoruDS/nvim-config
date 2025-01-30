local M = {}

local utils = require("dotfiles.utils")

local keyset = vim.keymap.set
local opts = { silent = true }

function M.setup()
  keyset(
    "n",
    "<leader>bq",
    "<cmd>bp|bd#<CR>",
    utils.merge_tables(opts, {
      desc = "Buffer close",
    })
  )
end

return M
