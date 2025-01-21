local theme = {
  fill = "TabLineFill",
  head = "TabLine",
  current_tab = "TabLineSel",
  tab = "TabLine",
  win = "TabLine",
}

require("tabby").setup({
  line = function(line)
    return {
      line.tabs().foreach(function(tab)
        local hl = tab.is_current() and theme.current_tab or theme.tab
        return {
          line.sep(" ", hl, theme.fill),
          tab.in_jump_mode() and tab.jump_key() or tab.number(),
          tab.name(),
          tab.is_current() and tab.close_btn("") or nil,
          line.sep(" ", hl, theme.fill),
          hl = hl,
          margin = " ",
        }
      end),
      line.spacer(),
      line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
        return {
          line.sep("", theme.win, theme.fill),
          win.is_current() and "" or "",
          win.buf_name(),
          line.sep("", theme.win, theme.fill),
          hl = theme.win,
          margin = " ",
        }
      end),
      hl = theme.fill,
    }
  end,
})
