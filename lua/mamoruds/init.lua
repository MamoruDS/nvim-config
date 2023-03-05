require("mamoruds.providers")
require("mamoruds.options")
require("mamoruds.plugins")

if vim.fn.argc() > 0 then
    vim.api.nvim_command("set ft=conf")
end
