local config = require("dotfiles.config").config

vim.opt.number = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.autoread = true
vim.opt.background = "dark"
vim.opt.cursorline = true
vim.opt.fileencoding = "utf-8"
vim.opt.mouse = "a"
vim.opt.updatetime = 250

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

-- # global variables
vim.g.notify_timeout = 5000

if vim.g.vscode then
    table.insert(config.plugins.load_tags.negative, "no-vscode")
end
