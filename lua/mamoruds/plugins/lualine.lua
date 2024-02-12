local ref_theme = require("lualine.themes.auto")

ref_theme.normal.c.bg = nil
ref_theme.insert.c.bg = nil
ref_theme.visual.c.bg = nil
ref_theme.replace.c.bg = nil
ref_theme.command.c.bg = nil
ref_theme.inactive.c.bg = nil

-- default
-- lualine_a = {'mode'},
-- lualine_b = {'branch', 'diff', 'diagnostics'},
-- lualine_c = {'filename'},
-- lualine_x = {'encoding', 'fileformat', 'filetype'},
-- lualine_y = {'progress'},
-- lualine_z = {'location'}

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
			"encoding",
			{ "fileformat", symbols = { unix = "LF", dos = "CRLF", mac = "CR" } },
		},
		lualine_y = { "filetype", "g:coc_status" },
		lualine_z = { "location" },
	},
})
