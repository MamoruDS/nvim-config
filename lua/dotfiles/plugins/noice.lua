require("noice").setup({
  presets = {
    bottom_search = true,
    command_palette = true,
    -- long_message_to_split = true,
  },
  cmdline = {
    view = "cmdline",
    format = {
      cmdline = { pattern = "^:", icon = ":", lang = "vim" },
      search_down = { kind = "search", pattern = "^/", icon = "/", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = "%?", lang = "regex" },
    },
  },
  messages = {
    view = "mini",
    view_warn = "mini",
  },
  notify = {
    enabled = true,
    -- view = "notify",
    view = "mini",
  },
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  views = {
    mini = {
      timeout = vim.g.notify_timeout or 5000,
      -- reverse = false,
      reverse = true,
      win_options = {
        winblend = 50,
      },
      -- winhighlight = {},
    },
  },
  format = {
    level = {
      icons = false,
      -- icons = {
      -- 	-- TODO: nerdfonts
      -- 	error = nil,
      -- 	warn = nil,
      -- 	info = nil,
      -- },
    },
  },
})

require("noice.config.format").builtin["default"] = {
  -- "[{level}] ",
  "{level} ",
  "{title}",
  "{message}",
}

-- TODO: PR: customizable level text

---@param message NoiceMessage
---@param opts NoiceFormatOptions.level
local function level(message, opts)
  if message.level then
    local str = message.level:upper()
    if opts.icons and opts.icons[message.level] then
      str = opts.icons[message.level] .. " " .. str
    end
    message:append(str, opts.hl_group[message.level])
  end
end

local noice_formatter = require("noice.text.format.formatters")
local stock_formatter = noice_formatter.level
noice_formatter.level = level
