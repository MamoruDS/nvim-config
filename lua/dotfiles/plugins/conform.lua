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
    bash = { "shfmt" },
    css = { "prettierd", "prettier", stop_after_first = true },
    html = { "prettierd", "prettier", stop_after_first = true },
    javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
    json = { "biome", "jq", "yq", "prettierd", "prettier", stop_after_first = true },
    jsonc = { "biome", "prettierd", "prettier", stop_after_first = true },
    lua = { "stylua" },
    markdown = { "prettierd", "prettier", stop_after_first = true },
    nix = { "nixfmt" },
    python = { "ruff_format", "black", stop_after_first = true },
    ruby = { "rubyfmt", "rubocop", stop_after_first = true },
    rust = { "rustfmt" },
    sh = { "shfmt" },
    toml = { "taplo" },
    typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
    xml = { "xmllint" },
    yaml = { "yq", "prettierd", "prettier", stop_after_first = true },
    zig = { "zigfmt" },
  },
  log_level = vim.log.levels.WARN,
  format_after_save = format,
})
