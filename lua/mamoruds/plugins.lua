local packer_bootstrap = false
local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
    vim.fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim.git',
        packer_path
    }
    vim.o.runtimepath = vim.o.runtimepath .. ',' .. packer_path
    packer_bootstrap = true
end


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
            'lukas-reineke/indent-blankline.nvim',
            config = function()
                require('mamoruds.plugins.indent_blankline')
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

        use {
            'numirias/semshi',
            -- cond = function()
            --     return (vim.fn.executable('python') == 1)
            -- end,
            ft = 'python',
            run = ':UpdateRemotePlugins',
        }
        {{/if}}

        use {
            'ojroques/vim-oscyank',
            branch = 'main',
            config = function()
                require('mamoruds.plugins.oscyank')
            end,
        }

        use {
            'nvim-treesitter/nvim-treesitter',
            run = function()
                local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                ts_update()
            end,
        }

        use {
            'github/copilot.vim',
            cond = function()
                return (vim.fn.executable('node') == 1) or (vim.fn.empty(vim.g.copilot_node_command) == 0)
            end,
            setup = function()
                require('mamoruds.plugins.copilot')
            end,
        }

        if packer_bootstrap then
            require('packer').sync()
        end
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
