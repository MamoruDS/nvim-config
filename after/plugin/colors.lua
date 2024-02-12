vim.cmd([[
    hi NormalFloat  ctermbg=None    guibg=None
]])

if vim.opt.background:get() == "dark" then
	vim.cmd([[
        hi FloatBorder  ctermfg=8       guifg=#32363d
        hi Search       guibg=#867647
        hi VertSplit    ctermfg=8       guifg=#32363d
    ]])
end
