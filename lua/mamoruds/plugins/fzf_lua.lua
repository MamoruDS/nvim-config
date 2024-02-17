local function get_hex_hl(name, value)
	local hl = vim.api.nvim_get_hl_by_name(name, true)
	return string.format("#%06x", hl[value])
end

local colors = {
	fg = get_hex_hl("Normal", "foreground"),
	["fg+"] = get_hex_hl("Normal", "foreground"),
	["bg+"] = get_hex_hl("CursorLine", "background"),
	hl = get_hex_hl("String", "foreground"),
	["hl+"] = get_hex_hl("Title", "foreground"),
	-- prompt = ,
	spinner = get_hex_hl("Title", "foreground"),
	pointer = get_hex_hl("Title", "foreground"),
	info = get_hex_hl("PreProc", "foreground"),
	-- info = ,
	header = get_hex_hl("NonText", "foreground"),
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
})

vim.api.nvim_set_hl(0, "FzfLuaBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "FzfLuaBufFlagCur", { link = "NonText" })
vim.api.nvim_set_hl(0, "FzfLuaHeaderBind", { fg = "#d29922" })
vim.api.nvim_set_hl(0, "FzfLuaHeaderText", { link = "NonText" })
