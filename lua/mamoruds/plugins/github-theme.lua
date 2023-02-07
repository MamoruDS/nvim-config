-- https://github.com/projekt0n/github-nvim-theme#configuration

{{#if (eq nvim_background "dark")}}
require("github-theme").setup({
    theme_style = "dark_default",
    function_style = "italic",
    sidebars = {"qf", "vista_kind", "terminal", "packer"},
    {{#if (eq nvim_transparent_bg 1)}}
    transparent = true
    {{/if}}
})
vim.cmd[[
    hi LineNr       ctermbg=None    ctermfg=240 guifg=#5d5f61
    hi CursorLine   ctermbg=8       guibg=#292e36
]]
{{else}}
{{#if (eq nvim_background "light")}}
require("github-theme").setup({
    theme_style = "light",
    function_style = "italic",
    sidebars = {"qf", "vista_kind", "terminal", "packer"},
    {{#if (eq nvim_transparent_bg 1)}}
    transparent = true
    {{/if}}
})
{{else}}
require("github-theme").setup({
    {{#if (eq nvim_transparent_bg 1)}}
    transparent = true
    {{/if}}
})
{{/if}}
{{/if}}
