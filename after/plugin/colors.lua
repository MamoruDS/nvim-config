if vim.opt.background:get() == 'dark' then
    vim.cmd[[
        hi NormalFloat  ctermbg=None    guibg=None
    ]]
else
    vim.cmd[[
        hi NormalFloat  ctermbg=None    guibg=None
    ]]
end
