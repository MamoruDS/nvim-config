local utils = require("dotfiles.utils")

local config = require("dotfiles.config")
-- TODO:
config.setup({
  appearances = {
    -- {{#if (eq dark_mode 0)}}
    dark_mode = false,
    -- {{/if}}
    -- {{#if (eq use_nerdfont 1)}}
    use_nerdfont = true,
    -- {{/if}}
    -- {{#if (eq nvim_transparent_bg 1)}}
    transparent_bg = true,
    -- {{/if}}
  },
})

utils.require("options")

local neg_tags = {}
if vim.g.vscode then
  table.insert(neg_tags, "no-vscode")
end
local plugins = require("dotfiles.plugins")
plugins.setup({
  tags = {
    negative = neg_tags,
  },
})

utils.require("keymaps")

if vim.fn.argc() > 0 then
  vim.cmd([["set ft=conf"]])
end
