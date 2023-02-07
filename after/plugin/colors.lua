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