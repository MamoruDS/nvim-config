-- https://github.com/projekt0n/github-nvim-theme#configuration

require("github-theme").setup({
	options = {
		styles = {
			functions = "italic",
		},
		darken = {
			sidebar = {
				list = { "qf", "vista_kind", "terminal", "packer" },
			},
		},
		-- {{#if (eq nvim_transparent_bg 1)}}
		transparent = true,
		-- {{/if}}
	},
})
-- {{#if (eq nvim_background "dark")}}
vim.cmd([[
    hi LineNr       ctermbg=None    ctermfg=240 guifg=#5d5f61
    hi CursorLine   ctermbg=8       guibg=#292e36
    colorscheme github_dark_tritanopia
]])
-- {{/if}}
-- {{#if (eq nvim_background "light")}}
vim.cmd([[
    colorscheme github_light
]])
-- {{/if}}
