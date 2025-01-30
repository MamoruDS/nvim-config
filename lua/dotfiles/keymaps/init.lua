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

keyset("n", "<space>e", vim.diagnostic.open_float, { desc = "vim.diagnostic.open_float()" })
keyset("n", "<space>q", vim.diagnostic.setloclist, { desc = "vim.diagnostic.setloclist()" })

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

keyset(
  "n",
  "<leader>ss",
  "<cmd>mkssesion!<CR>",
  utils.merge_tables(opts, {
    desc = "session: save",
  })
)
keyset(
  "n",
  "<leader>sl",
  "<cmd>source Session.vim<CR>",
  utils.merge_tables(opts, {
    desc = "session: load",
  })
)

require("dotfiles.keymaps.presets.buffer").setup()
require("dotfiles.keymaps.presets.lsp").setup()

require("dotfiles.keymaps.presets.plugin-dial").setup()
require("dotfiles.keymaps.presets.plugin-fzflua").setup()
require("dotfiles.keymaps.presets.plugin-telescope").setup()
require("dotfiles.keymaps.presets.plugin-vscode").setup()
