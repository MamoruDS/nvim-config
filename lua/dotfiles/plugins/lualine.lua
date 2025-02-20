local ref_theme = require("lualine.themes.auto")

local config = require("dotfiles.config").config

ref_theme.normal.c.bg = nil
ref_theme.insert.c.bg = nil
ref_theme.visual.c.bg = nil
ref_theme.replace.c.bg = nil
ref_theme.command.c.bg = nil
ref_theme.inactive.c.bg = nil

-- TODO: mod
--- @return string[]
local function get_available_formatters()
  local bufnr = vim.api.nvim_get_current_buf()
  local available = {}
  local function add_to_available(info)
    if info.available then
      table.insert(available, info.name)
    end
    return info.available
  end
  local names = require("conform").list_formatters_for_buffer(bufnr)
  for _, name in ipairs(names) do
    if type(name) == "string" then
      add_to_available(require("conform").get_formatter_info(name))
    else
      for i, v in ipairs(name) do
        local info = require("conform").get_formatter_info(v, bufnr)
        if add_to_available(info) then
          break
        end
      end
    end
  end

  return available
end

local function has_ts_parser()
  local function is_parser_available(filetype)
    local available_parsers = require("nvim-treesitter.parsers").available_parsers()
    for _, parser in ipairs(available_parsers) do
      if parser == filetype then
        return true
      end
    end
    return false
  end

  if vim.bo.filetype ~= "" and is_parser_available(vim.bo.filetype) then
    return require("nvim-treesitter.parsers").has_parser(vim.bo.filetype)
  else
    return true
  end
end

require("lualine").setup({
  options = {
    theme = ref_theme,
    component_separators = { "", "" },
    section_separators = { "", "" },
  },
  sections = {
    lualine_a = {},
    lualine_b = {
      "filename",
      -- 'diff',
    },
    lualine_c = {
      { "branch", icon = "" },
      {
        "diagnostics",
        symbols = {
          error = "E",
          warn = "W",
          info = "I",
          hint = "H",
        },
        sources = { "nvim_diagnostic", "coc" },
      },
    },
    lualine_x = {
      {
        function()
          local formatters = get_available_formatters()
          local fmt_indicator = ""
          if #formatters > 0 then
            if not config.misc.format.enable then
              fmt_indicator = fmt_indicator .. "[x]"
            end
            fmt_indicator = fmt_indicator .. table.concat(formatters, ",")
          end
          return fmt_indicator
        end,
        event = "BufEnter",
      },
      {
        function()
          if has_ts_parser() then
            return ""
          else
            return "!TS"
          end
        end,
        event = "BufEnter",
      },
      {
        function()
          if vim.bo.fileencoding ~= "utf-8" then
            return vim.bo.fileencoding
          else
            return ""
          end
        end,
        event = "BufEnter",
      },
      { "fileformat", symbols = { unix = "LF", dos = "CRLF", mac = "CR" } },
    },
    lualine_y = { "filetype" },
    lualine_z = { "location" },
  },
})
