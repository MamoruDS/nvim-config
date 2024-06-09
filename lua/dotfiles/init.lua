local utils = require("dotfiles.utils")

local config = require("dotfiles.config")
-- TODO:
config.setup({})

utils.require("options")

neg_tags = {}
if vim.g.vscode then
  table.insert(neg_tags, "no-vscode")
end
local plugins = require("dotfiles.plugins")
plugins.setup({
  tags = {
    negative = neg_tags,
  },
})

utils.require("keymaps")

if vim.fn.argc() > 0 then
  vim.cmd([["set ft=conf"]])
end
