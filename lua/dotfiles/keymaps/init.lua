local utils = require("dotfiles.utils")

local keyset = vim.keymap.set
local opts = {
  -- noremap = true,
  silent = true,
  -- expr = true,
  -- replace_keycodes = false,
}

keyset("n", "<leader>;", ":", { noremap = true, silent = false })

keyset("n", "<leader>tl", "<cmd>LspInfo<CR>", opts)

if vim.fn.exists(":ConformInfo") ~= 0 then
  opts = { silent = true }
  keyset("n", "<leader>tc", "<cmd>ConformInfo<CR>", opts)
end

if vim.fn.exists(":NvimTreeToggle") ~= 0 then
  opts = { silent = true }
  keyset("n", "<leader>te", "<cmd>NvimTreeToggle<CR>", opts)
end

if vim.fn.exists(":Noice") ~= 0 then
  opts = { silent = true }
  keyset("n", "<leader>tn", "<cmd>Noice history<CR>", opts)
end

require("dotfiles.keymaps.presets.buffer").setup()
require("dotfiles.keymaps.presets.diagnostic").setup()
require("dotfiles.keymaps.presets.lsp").setup()
require("dotfiles.keymaps.presets.session").setup()

require("dotfiles.keymaps.presets.plugin-dial").setup()
require("dotfiles.keymaps.presets.plugin-fzflua").setup()
require("dotfiles.keymaps.presets.plugin-telescope").setup()
require("dotfiles.keymaps.presets.plugin-vscode").setup()
