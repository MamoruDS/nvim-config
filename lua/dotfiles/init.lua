local utils = require("dotfiles.utils")

require("dotfiles.config").setup({})

local colors = require("dotfiles.colors")

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = colors.apply,
})

utils.require("options")

require("dotfiles.plugins").setup()

utils.require("keymaps")

if vim.fn.argc() > 0 then
  vim.cmd([["set ft=conf"]])
end
