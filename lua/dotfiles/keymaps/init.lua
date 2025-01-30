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

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- `:h vim.lsp.*`
    local opts = { buffer = ev.buf }
    keyset(
      "n",
      "gD",
      vim.lsp.buf.declaration,
      utils.merge_tables(opts, {
        desc = "vim.lsp.buf.declaration()",
      })
    )
    keyset(
      "n",
      "gd",
      vim.lsp.buf.definition,
      utils.merge_tables(opts, {
        desc = "vim.lsp.buf.definition()",
      })
    )
    keyset(
      "n",
      "K",
      vim.lsp.buf.hover,
      utils.merge_tables(opts, {
        desc = "vim.lsp.buf.hover()",
      })
    )
    keyset(
      "n",
      "gi",
      vim.lsp.buf.implementation,
      utils.merge_tables(opts, {
        desc = "vim.lsp.buf.implementation()",
      })
    )
    keyset(
      "n",
      "<C-k>",
      vim.lsp.buf.signature_help,
      utils.merge_tables(opts, {
        desc = "vim.lsp.buf.signature_help()",
      })
    )
    -- keyset("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    -- keyset("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    -- keyset("n", "<space>wl", function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    keyset(
      "n",
      "<space>D",
      vim.lsp.buf.type_definition,
      utils.merge_tables(opts, {
        desc = "vim.lsp.buf.type_definition()",
      })
    )
    keyset(
      "n",
      "<space>rn",
      vim.lsp.buf.rename,
      utils.merge_tables(opts, {
        desc = "()",
      })
    )
    keyset(
      { "n", "v" },
      "<space>ca",
      vim.lsp.buf.code_action,
      utils.merge_tables(opts, {
        desc = "vim.lsp.buf.code_action()",
      })
    )
    keyset(
      "n",
      "gr",
      vim.lsp.buf.references,
      utils.merge_tables(opts, {
        desc = "vim.lsp.buf.references()",
      })
    )
  end,
})

if vim.fn.exists(":ConformInfo") ~= 0 then
  opts = { silent = true }
  keyset("n", "<leader>tc", "<cmd>ConformInfo<CR>", opts)
end

keyset({ "n", "v" }, "<C-a>", function()
  require("dial.map").manipulate("increment", "normal")
end)
keyset({ "n", "v" }, "<C-x>", function()
  require("dial.map").manipulate("decrement", "normal")
end)

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

require("dotfiles.keymaps.presets.plugin-fzflua").setup()
require("dotfiles.keymaps.presets.plugin-telescope").setup()
require("dotfiles.keymaps.presets.plugin-vscode").setup()
