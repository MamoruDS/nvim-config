if vim.opt.background:get() == 'dark' then
    vim.cmd[[
        hi NormalFloat  ctermbg=None    guibg=None
        hi FloatBorder  ctermfg=8       guifg=#32363d    
        hi VertSplit    ctermfg=8       guifg=#32363d
    ]]
else
    vim.cmd[[
        hi NormalFloat  ctermbg=None    guibg=None
    ]]
end
