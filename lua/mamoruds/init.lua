require("mamoruds.providers")
require("mamoruds.options")
require("mamoruds.plugins")
require("mamoruds.keymaps")

if vim.fn.argc() > 0 then
  vim.cmd([["set ft=conf"]])
end
