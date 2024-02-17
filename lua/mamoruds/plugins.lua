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
	if not status then
		if not string.find(err, "not found:") then
			vim.notify({
				"Failed to load module: " .. local_prefix .. "." .. module_name .. "\n" .. err,
				vim.log.levels.ERROR,
			})
		end
	end
end

require("lazy").setup({
	{
		"numToStr/Comment.nvim",
		event = "BufEnter",
		config = function()
			_require("plugins.comment")
		end,
	},

	{
		"rcarriga/nvim-notify",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			_require("plugins.nvim-notify")
		end,
	},

	-- {
	-- 	"j-hui/fidget.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	enabled = false, -- due to slow
	-- 	config = function()
	-- 		_require("plugins.fidget")
	-- 	end,
	-- },

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			-- "rcarriga/nvim-notify",
		},
		config = function()
			_require("plugins.noice")
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
		cmd = { "NvimTreeToggle", "NvimTreeOpen" },
		config = function()
			_require("plugins.nvim-tree")
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufEnter",
		config = function()
			_require("plugins.indent_blankline")
		end,
	},

	-- {
	-- 	"neoclide/coc.nvim",
	-- 	branch = "release",
	-- 	enabled = false,
	-- 	cond = function()
	-- 		return ((vim.fn.executable("node") == 1) or (vim.fn.empty(vim.g.node_host_prog) == 0))
	-- 			and vim.wo.diff ~= true
	-- 	end,
	-- 	config = function()
	-- 		_require("plugins.coc")
	-- 	end,
	-- },

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
		config = function()
			_require("plugins.nvim-treesitter")
		end,
	},

	{
		"github/copilot.vim",
		event = "InsertEnter",
		cond = function()
			return ((vim.fn.executable("node") == 1) or (vim.fn.empty(vim.g.copilot_node_command) == 0))
				and vim.wo.diff ~= true
		end,
		init = function()
			_require("plugins.copilot")
		end,
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			_require("plugins.which_key")
		end,
	},

	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		-- dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			_require("plugins.fzf_lua")
		end,
	},

	{
		"stevearc/conform.nvim",
		event = "BufEnter",
		config = function()
			_require("plugins.conform")
		end,
	},

	-- lsp

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			_require("plugins.lsp_config")
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			_require("plugins.nvim_cmp")
		end,
	},

	-- per filetype

	{
		"gabrielelana/vim-markdown",
		ft = "markdown",
	},

	{
		"mrcjkb/rustaceanvim",
		version = "^4",
		ft = { "rust" },
	},

	{
		"cespare/vim-toml",
		ft = "toml",
	},

	{
		"neoclide/jsonc.vim",
		ft = "jsonc",
	},

	-- {
	-- 	"numirias/semshi",
	-- 	enabled = false,
	-- 	cond = function()
	-- 		return (vim.fn.executable("python") == 1)
	-- 	end,
	-- 	ft = "python",
	-- 	build = ":UpdateRemotePlugins",
	-- 	config = function()
	-- 		_require("plugins.semshi")
	-- 	end,
	-- },
})
