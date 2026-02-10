local status, configs = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

configs.setup({
  -- ensure_installed = {},
  sync_install = false,
  highlight = { enable = true },
  indent = {
    enable = true,
    disable = { "python" },
  },
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
