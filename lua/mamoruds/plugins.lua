vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- https://github.com/projekt0n/github-nvim-theme
    use({
        'projekt0n/github-nvim-theme',
        config = function() require('github-theme').setup({}) end
    })

    -- https://github.com/airblade/vim-gitgutter
    use 'airblade/vim-gitgutter'

    -- https://github.com/itchyny/lightline.vim
    use 'itchyny/lightline.vim'
    {{#if nvim_node_host_prog}}

    -- https://github.com/neoclide/coc.nvim
    use({'neoclide/coc.nvim', branch = 'release'})
    {{/if}}

    -- https://github.com/preservim/nerdtree
    use 'preservim/nerdtree'

    -- https://github.com/preservim/nerdcommenter
    use 'preservim/nerdcommenter'

    -- https://github.com/gabrielelana/vim-markdown
    use 'gabrielelana/vim-markdown'

    -- https://github.com/nvim-tree/nvim-tree.lua
    use 'nvim-tree/nvim-web-devicons' -- optional, for file icons
    use 'nvim-tree/nvim-tree.lua'

    -- https://github.com/neoclide/jsonc.vim
    use 'neoclide/jsonc.vim'

    -- https://github.com/cespare/vim-toml
    use 'cespare/vim-toml'
    {{#if nvim_python3_host_prog}}

    -- https://github.com/numirias/semshi
    use {'numirias/semshi', run = ':UpdateRemotePlugins', ft = 'python'}
    {{/if}}

    -- https://github.com/ojroques/vim-oscyank
    use {'ojroques/vim-oscyank', branch = 'main'}
    {{#if nvim_plugin_copilot_node_host}}     

    -- https://github.com/github/copilot.vim
    use 'github/copilot.vim'
    {{/if}}
end)
