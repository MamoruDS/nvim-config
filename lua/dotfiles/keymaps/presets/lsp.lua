local M = {}

local utils = require("dotfiles.utils")

local keyset = vim.keymap.set

function M.setup()
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
end

return M
