local utils = require("dotfiles.utils")

utils.require("providers")
utils.require("options")

require("dotfiles.plugins")

utils.require("keymaps")

if vim.fn.argc() > 0 then
  vim.cmd([["set ft=conf"]])
end
