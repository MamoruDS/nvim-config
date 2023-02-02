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

{{#if (eq 0 1)}}
require("mamoruds.colors")
{{/if}}
require("mamoruds.providers")
require("mamoruds.plugins")
