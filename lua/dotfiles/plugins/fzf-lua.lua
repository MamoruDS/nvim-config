--- @param name string
--- @param value string
local function get_hex_hl(name, value)
  local hl = vim.api.nvim_get_hl(0, { name = name })
  return string.format("#%06x", hl[value])
end

local colors = {
  fg = get_hex_hl("Normal", "fg"),
  ["fg+"] = get_hex_hl("Normal", "fg"),
  ["bg+"] = get_hex_hl("CursorLine", "bg"),
  hl = get_hex_hl("String", "fg"),
  ["hl+"] = get_hex_hl("Title", "fg"),
  -- prompt = ,
  spinner = get_hex_hl("Title", "fg"),
  pointer = get_hex_hl("Title", "fg"),
  info = get_hex_hl("PreProc", "fg"),
  -- info = ,
  header = get_hex_hl("NonText", "fg"),
}
local fzf_colors = {}
for k, v in pairs(colors) do
  table.insert(fzf_colors, k .. ":" .. v)
end

require("fzf-lua").setup({
  "default",
  fzf_opts = {
    ["--color"] = table.concat(fzf_colors, ","),
    -- ["--pointer"] = "●",
    ["--info"] = "right",
  },
  winopts = { width = 0.85, height = 0.85 },
})

vim.api.nvim_set_hl(0, "FzfLuaBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "FzfLuaBufFlagCur", { link = "NonText" })
vim.api.nvim_set_hl(0, "FzfLuaHeaderBind", { fg = "#d29922" })
vim.api.nvim_set_hl(0, "FzfLuaHeaderText", { link = "NonText" })
