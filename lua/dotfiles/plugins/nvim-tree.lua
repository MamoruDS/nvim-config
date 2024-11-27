-- https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
local config = require("dotfiles.config").config

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

if vim.opt.background:get() == "dark" then
  vim.cmd([[
        hi NvimTreeFolderIcon   guifg=#90a4ae
        "
        hi NvimTreeNormal           guifg=#adbac7
        hi NvimTreeFolderName       guifg=#adbac7
        hi NvimTreeOpenedFolderName guifg=#adbac7
        hi NvimTreeGitIgnored       guifg=#535b63
        hi link NvimTreeEmptyFolderName NvimTreeGitIgnored
    ]])
else
  vim.cmd([[
        hi NvimTreeFolderIcon   guifg=#90a4ae
        "
        hi NvimTreeGitIgnored       guifg=#b1bac4
        hi link NvimTreeEmptyFolderName NvimTreeGitIgnored
    ]])
end

local cfg_icons = {
  git_placement = "after",
  glyphs = {
    git = {
      deleted = "D",
      ignored = "",
      renamed = "R",
      staged = "S",
      unmerged = "",
      unstaged = "M",
      untracked = "U",
    },
  },
}

if not config.appearances.nerdfont then
  cfg_icons.show = {
    file = false,
    folder = false,
    folder_arrow = true,
    git = true,
    modified = false,
  }
  cfg_icons.glyphs.folder = {
    arrow_closed = ">",
    arrow_open = "v",
  }
end

require("nvim-tree").setup({
  view = {
    float = {
      enable = true,
      open_win_config = {
        border = "single",
      },
    },
  },
  git = {
    ignore = false,
  },
  hijack_cursor = true,
  sync_root_with_cwd = true,
  renderer = {
    group_empty = true,
    full_name = true,
    highlight_git = true,
    highlight_opened_files = "none",
    icons = cfg_icons,
  },
})
