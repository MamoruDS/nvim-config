require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'projekt0n/github-nvim-theme',
        config = function()
            require('mamoruds.plugins.github-theme')
        end,
    }

    use {
        'nvim-lualine/lualine.nvim',
        event = 'BufEnter',
        config = function()
            require('mamoruds.plugins.lualine')
        end,
    }

    use {
        'lewis6991/gitsigns.nvim',
        event = 'BufRead',
        config = function()
            require('mamoruds.plugins.gitsigns')
        end,
    }
    {{#if nvim_node_host_prog}}

    use {
        'neoclide/coc.nvim',
        branch = 'release',
        config = function()
            require('mamoruds.plugins.coc')
        end,
    }
    {{/if}}

    use 'preservim/nerdtree'

    use 'preservim/nerdcommenter'

    use 'gabrielelana/vim-markdown'

    use 'nvim-tree/nvim-web-devicons' -- optional, for file icons
    use 'nvim-tree/nvim-tree.lua'

    use 'neoclide/jsonc.vim'

    use 'cespare/vim-toml'
    {{#if nvim_python3_host_prog}}

    use { 'numirias/semshi', run = ':UpdateRemotePlugins', ft = 'python' }
    {{/if}}

    use {
        'ojroques/vim-oscyank',
        branch = 'main',
        config = function()
            require('mamoruds.plugins.oscyank')
        end,
    }
    {{#if nvim_plugin_copilot_node_host}}     

    use 'github/copilot.vim'
    {{/if}}
end)
