vim.opt.number = true
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

require("mamoruds.colors")
require("mamoruds.plugins")
require("mamoruds.plugin_config")
