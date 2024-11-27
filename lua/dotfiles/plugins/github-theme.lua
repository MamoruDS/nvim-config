-- https://github.com/projekt0n/github-nvim-theme#configuration

local config = require("dotfiles.config").config

require("github-theme").setup({
  options = {
    styles = {
      functions = "italic",
    },
    darken = {
      sidebar = {
        list = { "qf", "vista_kind", "terminal", "packer" },
      },
    },
    transparent = config.appearances.transparent_bg,
  },
})

if config.appearances.dark_mode then
  vim.cmd([[
      hi LineNr       ctermbg=None    ctermfg=240 guifg=#5d5f61
      hi CursorLine   ctermbg=8       guibg=#292e36
      colorscheme github_dark_tritanopia
  ]])
else
  vim.cmd([[
    colorscheme github_light
]])
end
