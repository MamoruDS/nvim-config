require('packer').startup {
    function(use)
        use 'wbthomason/packer.nvim'

        use {
            'numToStr/Comment.nvim',
            config = function()
                require('mamoruds.plugins.comment')
            end
        }

        use {
            'rcarriga/nvim-notify',
            config = function()
                require('mamoruds.plugins.nvim-notify')
            end,
        }

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

        {{#if (eq use_nerdfont 1)}}
        use 'nvim-tree/nvim-web-devicons'

        {{/if}}
        use {
            'nvim-tree/nvim-tree.lua',
            config = function()
                require('mamoruds.plugins.nvim-tree')
            end,
        }

        use {
            'neoclide/coc.nvim',
            branch = 'release',
            cond = function()
                return (vim.fn.executable('node') == 1) or (vim.fn.empty(vim.g.node_host_prog) == 0)
            end,
            config = function()
                require('mamoruds.plugins.coc')
            end,
        }

        use 'gabrielelana/vim-markdown'

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

        use {
            'github/copilot.vim',
            cond = function()
                return (vim.fn.executable('node') == 1) or (vim.fn.empty(vim.g.copilot_node_command) == 0)
            end,
        }
    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float {
                    border = 'single',
                    anchor = 'NE',
                    row = 1,
                    col = vim.o.columns - 1,
                    width = 50,
                }
            end
        }
    },
}
