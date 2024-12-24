local M = {}

local utils = require("dotfiles.utils")

--- @class dotfiles.config.default_opts
--- @field appearances dotfiles.config.appearances
--- @field lsp_clients {[string]: dotfiles.config.lsp_client}
--- @field plugins dotfiles.config.plugins
M.default_opts = {
  appearances = {
    dark_mode = true,
    nerdfont = false,
    transparent_bg = false,
  },
  lsp_clients = {},
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

--- @class dotfiles.config.lsp_client
--- @field setup? function
--- @field config? table

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
--- @field plugins? dotfiles.config.plugins
M.config = {}

function M.setup(opts)
  M.config = utils.merge_tables(M.default_opts, opts)
end

return M
