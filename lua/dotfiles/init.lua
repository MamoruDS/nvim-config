require("dotfiles.config").setup({})

require("dotfiles.options")
pcall(require, "local.options")

local colors = require("dotfiles.colors")
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = colors.apply,
})

require("dotfiles.plugins").setup()

require("dotfiles.keymaps")
pcall(require, "local.keymaps")

pcall(require, "local.init")

if vim.fn.argc() > 0 then
  vim.cmd([["set ft=conf"]])
end
