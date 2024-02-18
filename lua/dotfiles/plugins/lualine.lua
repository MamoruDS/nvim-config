local ref_theme = require("lualine.themes.auto")

ref_theme.normal.c.bg = nil
ref_theme.insert.c.bg = nil
ref_theme.visual.c.bg = nil
ref_theme.replace.c.bg = nil
ref_theme.command.c.bg = nil
ref_theme.inactive.c.bg = nil

-- TODO: mod
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
  if vim.bo.filetype ~= "" then
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
          if #formatters > 0 then
            -- return "fmt:" .. table.concat(formatters, ",")
            return table.concat(formatters, ",")
          else
            return ""
          end
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
      "encoding",
      { "fileformat", symbols = { unix = "LF", dos = "CRLF", mac = "CR" } },
    },
    lualine_y = { "filetype", "g:coc_status" },
    lualine_z = { "location" },
  },
})
