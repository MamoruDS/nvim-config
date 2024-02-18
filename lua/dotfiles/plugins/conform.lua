-- https://github.com/stevearc/conform.nvim/issues/250#issuecomment-1879773592
local function open_progress_win()
  local bufnr = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "Formatting..." }) -- TODO:
  local winid = vim.api.nvim_open_win(bufnr, false, {
    relative = "editor",
    anchor = "SE",
    row = vim.o.lines - 2,
    col = vim.o.columns,
    width = 20,
    height = 1,
    style = "minimal",
    border = "rounded",
    focusable = false,
    noautocmd = true,
  })
  vim.bo[bufnr].bufhidden = "wipe"
  return winid
end

local function format()
  require("conform").format({
    async = true,
    quiet = true,
    lsp_fallback = true,
  }, function(err)
    local winid = open_progress_win()
    vim.api.nvim_win_close(winid, true)
    if err then
      -- TODO: detailed error message
      vim.notify("conform: failed to format", vim.log.levels.WARN)
    end
  end)
end

require("conform").setup({
  formatters_by_ft = {
    css = { { "prettierd", "prettier" } },
    html = { { "prettierd", "prettier" } },
    javascript = { { "prettierd", "prettier" } },
    json = { { "prettierd", "prettier" } },
    jsonc = { { "prettierd", "prettier" } },
    lua = { "stylua" },
    nix = { "nixfmt" },
    python = { { "ruff_format", "black" } },
    ruby = { { "rubyfmt", "rubocop" } },
    rust = { "rustfmt" },
    taplo = { "taplo" },
    typescript = { { "prettierd", "prettier" } },
    yaml = { { "prettierd", "prettier" } },
  },
  log_level = vim.log.levels.WARN,
  format_after_save = format,
})
