local M = {}

local keyset = vim.keymap.set

function M.setup()
  if vim.fn.exists(":DialIncrement") ~= 0 then
    local dial = require("dial.map")
    keyset({ "n", "v" }, "<C-a>", function()
      dial.manipulate("increment", "normal")
    end)
    keyset({ "n", "v" }, "<C-x>", function()
      dial.manipulate("decrement", "normal")
    end)
  end
end

return M
