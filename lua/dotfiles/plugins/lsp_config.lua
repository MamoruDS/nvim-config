vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  callback = function()
    vim.lsp.buf.document_highlight()
  end,
})

vim.api.nvim_create_autocmd("CursorMoved", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.clear_references()
  end,
})
