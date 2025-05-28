local M = {}

local config = require("dotfiles.config").config
local hl = require("dotfiles.utils.hl")

local blend = function(c1, c2, a)
  local C = require("github-theme.lib.color")
  return C(c1):blend(C(c2), a):to_css()
end

local bg = function(color)
  return config.appearances.transparent_bg and "none" or color
end

local hl_apply_nvimtree = function(spec)
  if vim.opt.background == "dark" then
    vim.cmd([[
        hi NvimTreeFolderIcon   guifg=#90a4ae
        "
        hi NvimTreeNormal           guifg=#adbac7
        hi NvimTreeFolderName       guifg=#adbac7
        hi NvimTreeOpenedFolderName guifg=#adbac7
        hi NvimTreeGitIgnored       guifg=#535b63
        hi link NvimTreeEmptyFolderName NvimTreeGitIgnored
    ]])
  else
    vim.cmd([[
        hi NvimTreeFolderIcon   guifg=#90a4ae
        "
        hi NvimTreeGitIgnored       guifg=#b1bac4
        hi link NvimTreeEmptyFolderName NvimTreeGitIgnored
    ]])
  end
end

local hl_apply_tabline = function(spec)
  local p = spec.palette

  -- local hi_tabline_filled = {
  --   bg = p.blue.base,
  --   fg = spec.bg1,
  -- }
  local hi_tabline_sel = {
    bg = blend(spec.bg1, p.blue.base, 0.2),
    fg = blend(spec.bg1, p.blue.base, 0.8),
  }
  local hi_tabline = {
    bg = bg(blend(spec.bg1, p.blue.base, 0.01)),
    fg = blend(spec.bg1, p.blue.base, 0.6),
  }
  hl.set("TabLineSel", hi_tabline_sel)
  hl.set("TabLine", hi_tabline)
end

function M.apply()
  local style = vim.g.colors_name
  local spec = require("github-theme.spec").load(style)

  hl_apply_nvimtree(spec)
  hl_apply_tabline(spec)

  if vim.opt.background == "dark" then
    vim.cmd([[
        hi LineNr       ctermbg=None    ctermfg=240 guifg=#5d5f61
        hi CursorLine   ctermbg=8       guibg=#292e36

        hi FloatBorder  ctermfg=8       guifg=#4f5661
        hi Search       guibg=#867647
        hi VertSplit    ctermfg=8       guifg=#4f5661
    ]])
    hl.set("NormalFloat", { bg = "#2e333b" })
  else
    hl.set("NormalFloat", { bg = "#f6f8fa" })
  end
end

return M
