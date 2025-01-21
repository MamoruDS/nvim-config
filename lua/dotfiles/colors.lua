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

local hl_apply_tabline = function()
  local spec = require("github-theme.spec").load(vim.g.colors_name)
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
  hl_apply_tabline()

  if vim.opt.background == "dark" then
    vim.cmd([[
        hi FloatBorder  ctermfg=8       guifg=#4f5661
        hi Search       guibg=#867647
        hi VertSplit    ctermfg=8       guifg=#4f5661
    ]])
  end
end

return M
