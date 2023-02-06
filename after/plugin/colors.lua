{{#if (eq nvim_light_mode 0)}}
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
require("github-theme").setup({
    theme_style = "light",
    function_style = "italic",
    sidebars = {"qf", "vista_kind", "terminal", "packer"},
    {{#if (eq nvim_transparent_bg 1)}}
    transparent = true
    {{/if}}
})
{{/if}}

vim.cmd(
[[
    if has("patch-8.1.1564")
        set signcolumn=number
    else
        set signcolumn=auto
    endif
]]
,true)

-- -- TODO:
-- {{#if (eq nvim_global_bold 1)}}
-- vim.cmd(
-- [[
--     hi GlobalBold cterm=bold gui=bold
--     match GlobalBold /./
-- ]]
-- ,true)

-- {{/if}}