local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

function _require(module_name)
	local default_prefix = "mamoruds"
	local local_prefix = "local"
	require(default_prefix .. "." .. module_name)
	local status, err = pcall(require, local_prefix .. "." .. module_name)
	notify = require("notify")
	if not status then
		if not string.find(err, "not found:") then
			require("notify")("Failed to load module: " .. local_prefix .. "." .. module_name .. "\n" .. err, "error")
		end
	end
end

require("lazy").setup({
	{
		"numToStr/Comment.nvim",
		config = function()
			_require("plugins.comment")
		end,
	},

	{
		"rcarriga/nvim-notify",
		lazy = false,
		priority = 1000,
		config = function()
			_require("plugins.nvim-notify")
		end,
	},

	{
		"projekt0n/github-nvim-theme",
		lazy = false,
		priority = 100,
		config = function()
			_require("plugins.github-theme")
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		config = function()
			_require("plugins.lualine")
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		cond = function()
			return vim.wo.diff ~= true
		end,
		config = function()
			_require("plugins.gitsigns")
		end,
	},
	-- {{#if (eq use_nerdfont 1)}}

	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			_require("plugins.nvim-web-devicons")
		end,
	},
	-- {{/if}}

	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			_require("plugins.nvim-tree")
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			_require("plugins.indent_blankline")
		end,
	},

	{
		"neoclide/coc.nvim",
		branch = "release",
		cond = function()
			return ((vim.fn.executable("node") == 1) or (vim.fn.empty(vim.g.node_host_prog) == 0))
				and vim.wo.diff ~= true
		end,
		config = function()
			_require("plugins.coc")
		end,
	},

	{
		"ojroques/vim-oscyank",
		branch = "main",
		config = function()
			_require("plugins.oscyank")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},

	{
		"github/copilot.vim",
		cond = function()
			return ((vim.fn.executable("node") == 1) or (vim.fn.empty(vim.g.copilot_node_command) == 0))
				and vim.wo.diff ~= true
		end,
		init = function()
			_require("plugins.copilot")
		end,
	},

	-- per filetype

	{
		"gabrielelana/vim-markdown",
		ft = "markdown",
	},
	-- {{#if nvim_python3_host_prog}}

	{
		"numirias/semshi",
		-- cond = function()
		--     return (vim.fn.executable('python') == 1)
		-- end,
		ft = "python",
		build = ":UpdateRemotePlugins",
	},
	-- {{/if}}

	{
		"cespare/vim-toml",
		ft = "toml",
	},

	{
		"neoclide/jsonc.vim",
		ft = "jsonc",
	},
})
