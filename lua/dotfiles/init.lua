local utils = require("dotfiles.utils")

require("dotfiles.config").setup({})

utils.require("options")

require("dotfiles.plugins").setup()

utils.require("keymaps")

if vim.fn.argc() > 0 then
  vim.cmd([["set ft=conf"]])
end
