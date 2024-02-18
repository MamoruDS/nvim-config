local utils = require("mamoruds.utils")

utils.require("providers")
utils.require("options")

require("mamoruds.plugins")

utils.require("keymaps")

if vim.fn.argc() > 0 then
  vim.cmd([["set ft=conf"]])
end
