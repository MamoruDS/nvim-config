-- :h notify:Config
local base = require("notify.render.base")

function render(bufnr, notif, highlights)
  local namespace = base.namespace()
  local icon = notif.icon
  local title = notif.title[1]

  local prefix
  if title == nil or title == "" then
    prefix = string.format(" %s", icon)
  else
    prefix = string.format(" %s %s:", icon, title)
  end

  notif.message[1] = string.format("%s %s", prefix, notif.message[1])

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, notif.message)

  local icon_length = vim.str_utfindex(icon)
  local prefix_length = vim.str_utfindex(prefix)

  vim.api.nvim_buf_set_extmark(bufnr, namespace, 0, 0, {
    hl_group = highlights.icon,
    end_col = icon_length + 1,
    priority = 50,
  })
  vim.api.nvim_buf_set_extmark(bufnr, namespace, 0, icon_length + 1, {
    hl_group = highlights.title,
    end_col = prefix_length + 1,
    priority = 50,
  })
  vim.api.nvim_buf_set_extmark(bufnr, namespace, 0, prefix_length + 1, {
    hl_group = highlights.body,
    end_line = #notif.message,
    priority = 50,
  })
end

function max_width()
  return vim.fn.winwidth(0) / 2
end

local timeout = vim.g.notify_timeout or 5000

-- local stages = require("notify.stages.slide")("bottom_up")

require("notify").setup({
  -- stages = {
  -- 	function(...)
  -- 		local opts = stages[1](...)
  -- 		if opts then
  -- 			opts.border = "none"
  -- 		end
  -- 		return opts
  -- 	end,
  -- 	unpack(stages, 2),
  -- },
  stages = "slide",
  render = render,
  timeout = timeout,
  max_width = max_width,
  top_down = false,
})
vim.notify = require("notify")

vim.cmd([[
    hi NotifyINFOTitle  guifg=#58a6ff
]])
