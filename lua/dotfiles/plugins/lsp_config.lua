local on_attach = function(client, bufnr)
  if client.server_capabilities.documentHighLightProvider then
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      pattern = "*",
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.document_highlight()
      end,
    })

    vim.api.nvim_create_autocmd("CursorMoved", {
      pattern = "*",
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.clear_references()
      end,
    })
  end
end
