return {
	"nvim-lua/plenary.nvim", -- lua functions that many plugins use
	"christoomey/vim-tmux-navigator", -- tmux & split window navigation
	"savq/melange-nvim",
	"mbbill/undotree",
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	"NvChad/nvim-colorizer.lua",
	"projekt0n/github-nvim-theme",
	"ThePrimeagen/harpoon",
	"RRethy/base16-nvim",
	"metalelf0/black-metal-theme-neovim",
	"neanias/everforest-nvim",
	"EdenEast/nightfox.nvim",
	--{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	{ "rose-pine/neovim", name = "rose-pine" },
	-- In another file, e.g., lua/plugins/icons.lua
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	{ "kepano/flexoki-neovim", name = "flexoki" },

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equalent to setup({}) function
	},
	{
		"goolord/alpha-nvim",
		config = function()
			require("aib.plugins.alpha")
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional if you need icons
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^6", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
}
