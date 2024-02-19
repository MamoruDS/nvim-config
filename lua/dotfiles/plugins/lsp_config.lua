require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {},
})

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  callback = function()
    local opts = { silent = true }
    vim.lsp.buf.document_highlight(opts)
  end,
})

vim.api.nvim_create_autocmd("CursorMoved", {
  pattern = "*",
  callback = function()
    local opts = { silent = true }
    vim.lsp.buf.clear_references(opts)
  end,
})
