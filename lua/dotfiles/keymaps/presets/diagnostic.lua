local M = {}

local keyset = vim.keymap.set

function M.setup()
  keyset("n", "<space>e", vim.diagnostic.open_float, { desc = "vim.diagnostic.open_float()" })
  keyset("n", "<space>q", vim.diagnostic.setloclist, { desc = "vim.diagnostic.setloclist()" })
end

return M
