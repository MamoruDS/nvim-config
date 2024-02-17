local configs = require("nvim-treesitter.configs")

configs.setup({
	ensure_installed = { "lua" },
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },
})

local notified_fts = {}

local function check_treesitter_parser()
	local ft = vim.bo.filetype
	if notified_fts[ft] then
		return
	end

	local has_parser = pcall(require("nvim-treesitter.parsers").get_parser_configs, ft)

	if has_parser then
		local is_installed = require("nvim-treesitter.parsers").has_parser(ft)

		if not is_installed then
			vim.notify("TS parser for '" .. ft .. "' is not installed.")
		end
	end
end

vim.api.nvim_create_autocmd("BufRead", {
	callback = check_treesitter_parser,
})
