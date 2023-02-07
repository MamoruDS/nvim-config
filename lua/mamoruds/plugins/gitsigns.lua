-- https://github.com/lewis6991/gitsigns.nvim#usage
-- https://github.com/ful1e5/dotfiles/blob/main/nvim/.config/nvim/lua/ful1e5/plugins/gitsigns.lua

local bar_icon = '▌'

require('gitsigns').setup {
    signs = {
        add = { text = bar_icon },
        change = { text = bar_icon },
        delete = { text = bar_icon },
        topdelete = { text = bar_icon },
        changedelete = { text = bar_icon },
        untracked = { text = bar_icon },
    },
}
