local M = {}

local utils = require("dotfiles.utils")

--- @class dotfiles.config.default_opts
--- @field appearances dotfiles.config.appearances
--- @field lsp_clients {[string]: dotfiles.config.lsp_client}
--- @field misc dotfiles.config.misc
--- @field plugins dotfiles.config.plugins
M.default_opts = {
  appearances = {
    dark_mode = true,
    nerdfont = false,
    transparent_bg = false,
    extra_colors = nil,
  },
  lsp_clients = {},
  misc = {
    format = {
      enable = true,
      policy = "after_save",
    },
  },
  plugins = {
    load_tags = {
      positive = { "default" },
      negative = {},
    },
    extra_plugins = {
      -- ! tags field is required for per plugin
    },
    fuzzy_finder = "telescope", -- fzf-lua / telescope
  },
}

--- @class dotfiles.config.appearances
--- @field dark_mode? boolean
--- @field nerdfont? boolean
--- @field transparent_bg? boolean
--- @field extra_colors? (fun(step: GhTheme.Spec): nil) | nil

--- @class dotfiles.config.lsp_client
--- @field setup? function
--- @field config? table

--- @class dotfiles.config.misc.format
--- @field enable? boolean
--- @field policy? "after_save"|"on_save"

--- @class dotfiles.config.misc
--- @field format? dotfiles.config.misc.format

--- @class dotfiles.config.plugins.load_tags
--- @field positive? string[]
--- @field negative? string[]

--- @class dotfiles.config.plugins
--- @field load_tags? dotfiles.config.plugins.load_tags
--- @field extra_plugins? table
--- @field fuzzy_finder? "fzf-lua"|"telescope"

--- @class dotfiles.config
--- @field appearances? dotfiles.config.appearances
--- @field lsp_clients? {[string]: dotfiles.config.lsp_client}
--- @field misc? dotfiles.config.misc
--- @field plugins? dotfiles.config.plugins
M.config = {}

function M.setup(opts)
  M.config = utils.merge_tables(M.default_opts, opts)
end

vim.api.nvim_create_user_command("DotCfgToggleFormat", function()
  M.config.misc.format.enable = not M.config.misc.format.enable
  vim.notify("Format on/after save " .. (M.config.misc.format.enable and "enabled" or "disabled") .. ".")
end, { desc = "Toggle format on/after save." })

return M
