local config = require("dotfiles.config").config

local format_after_save = function()
  if config.misc.format.enable and config.misc.format.policy == "after_save" then
    return {}
  else
    return nil
  end
end

local format_on_save = function()
  if config.misc.format.enable and config.misc.format.policy == "on_save" then
    return {
      timeout_ms = 500,
    }
  else
    return nil
  end
end

require("conform").setup({
  default_format_opts = {
    lsp_format = "fallback",
  },
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
  format_after_save = format_after_save,
  format_on_save = format_on_save,
  log_level = vim.log.levels.WARN,
})
