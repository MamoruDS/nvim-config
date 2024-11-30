local utils = require("dotfiles.utils")

require("dotfiles.config").setup({})

utils.require("options")

local neg_tags = {}
if vim.g.vscode then
  table.insert(neg_tags, "no-vscode")
end

require("dotfiles.plugins").setup()

utils.require("keymaps")

if vim.fn.argc() > 0 then
  vim.cmd([["set ft=conf"]])
end
