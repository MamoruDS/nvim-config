-- help ibl.config

require("ibl").setup({
	indent = {
		char = "▏",
		-- char = "▌",
		-- highlight = { "VertSplit" },
	},
	exclude = {
		filetypes = {
			"terminal",
		},
		buftypes = {
			"terminal",
		},
	},
})

local hooks = require("ibl.hooks")
hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
