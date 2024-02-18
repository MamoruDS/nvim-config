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
-- {{#if use_nerdfont}}
vim.g.use_nerdfont = true
-- {{/if}}

-- # provider options
-- {{#if nvim_node_host_prog}}
vim.g.node_host_prog = "{{nvim_node_host_prog}}"
-- {{/if}}
-- {{#if nvim_plugin_copilot_node_host}}
vim.g.copilot_node_command = "{{nvim_plugin_copilot_node_host}}"
-- {{/if}}
