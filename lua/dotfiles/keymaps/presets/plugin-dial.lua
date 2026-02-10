local M = {}

local keyset = vim.keymap.set

function M.setup()
  local ok, dial = pcall(require, "dial.map")
  if ok then
    keyset({ "n", "v" }, "<C-a>", function()
      dial.manipulate("increment", "normal")
    end)
    keyset({ "n", "v" }, "<C-x>", function()
      dial.manipulate("decrement", "normal")
    end)
  end
end

return M
