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


function _require(module_name)
    local default_prefix = 'mamoruds'
    local local_prefix = 'local'
    require(default_prefix .. '.' .. module_name)
    local status, err = pcall(require, local_prefix .. '.' .. module_name)
    notify = require('notify')
    if not status then
        if not string.find(err, 'not found:') then
            require('notify')('Failed to load module: ' .. local_prefix .. '.' .. module_name .. '\n' .. err, 'error')
        end
    end
end

require('packer').startup {
    function(use)
        use 'wbthomason/packer.nvim'

        use {
            'numToStr/Comment.nvim',
            after = 'nvim-notify',
            config = function()
                _require('plugins.comment')
            end
        }

        use {
            'rcarriga/nvim-notify',
            config = function()
                _require('plugins.nvim-notify')
            end,
        }

        use {
            'projekt0n/github-nvim-theme',
            after = 'nvim-notify',
            config = function()
                _require('plugins.github-theme')
            end,
        }

        use {
            'nvim-lualine/lualine.nvim',
            after = 'nvim-notify',
            event = 'BufEnter',
            config = function()
                _require('plugins.lualine')
            end,
        }

        use {
            'lewis6991/gitsigns.nvim',
            after = 'nvim-notify',
            event = 'BufRead',
            config = function()
                _require('plugins.gitsigns')
            end,
        }

        {{#if (eq use_nerdfont 1)}}
        use {
            'nvim-tree/nvim-web-devicons',
            after = 'nvim-notify',
            config = function()
                _require('plugins.nvim-web-devicons')
            end,
        }

        {{/if}}
        use {
            'nvim-tree/nvim-tree.lua',
            after = 'nvim-notify',
            config = function()
                _require('plugins.nvim-tree')
            end,
        }

        use {
            'lukas-reineke/indent-blankline.nvim',
            after = 'nvim-notify',
            config = function()
                _require('plugins.indent_blankline')
            end,
        }

        use {
            'neoclide/coc.nvim',
            after = 'nvim-notify',
            branch = 'release',
            cond = function()
                return (vim.fn.executable('node') == 1) or (vim.fn.empty(vim.g.node_host_prog) == 0)
            end,
            config = function()
                _require('plugins.coc')
            end,
        }

        use {
            'gabrielelana/vim-markdown',
            after = 'nvim-notify',
        }

        use {
            'neoclide/jsonc.vim',
            after = 'nvim-notify',
        }

        use {
            'cespare/vim-toml',
            after = 'nvim-notify',
        }
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
            after = 'nvim-notify',
            branch = 'main',
            config = function()
                _require('plugins.oscyank')
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
            after = 'nvim-notify',
            cond = function()
                return (vim.fn.executable('node') == 1) or (vim.fn.empty(vim.g.copilot_node_command) == 0)
            end,
            setup = function()
                _require('plugins.copilot')
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
