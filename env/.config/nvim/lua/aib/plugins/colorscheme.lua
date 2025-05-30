return {
	-- NOTE: Rose pine
	{
		"rose-pine/neovim",
		name = "rose-pine",
		-- priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "main", -- auto, main, moon, or dawn
				dark_variant = "main", -- main, moon, or dawn
				dim_inactive_windows = false,
				-- disable_background = true,
				-- 	disable_nc_background = false,
				-- 	disable_float_background = false,
				-- extend_background_behind_borders = false,
				styles = {
					bold = true,
					italic = false,
					transparency = true,
				},
				highlight_groups = {
					ColorColumn = { bg = "#1C1C21" },
					Normal = { bg = "none" }, -- Main background remains transparent
					Pmenu = { bg = "", fg = "#e0def4" }, -- Completion menu background
					PmenuSel = { bg = "#4a465d", fg = "#f8f5f2" }, -- Highlighted completion item
					PmenuSbar = { bg = "#191724" }, -- Scrollbar background
					PmenuThumb = { bg = "#9ccfd8" }, -- Scrollbar thumb
				},
				enable = {
					terminal = false,
					legacy_highlights = false, -- Improve compatibility for previous versions of Neovim
					migrations = true, -- Handle deprecated options automatically
				},
			})

			-- HACK: set this on the color you want to be persistent
			-- when quit and reopening nvim
			vim.cmd("colorscheme base16-black-metal")
		end,
	},
	-- Using lazy.nvim
	{
		"metalelf0/black-metal-theme-neovim",
		config = function()
			require("black-metal").setup({
				theme = "taake",
				-- Can be one of: 'light' | 'dark', or set via vim.o.background
				variant = "dark",
				-- Use an alternate, lighter bg
				alt_bg = false, -- optional configuration here
			})
		end,
	},
	{

		"RRethy/base16-nvim",
		config = function()
			require("base16-colorscheme").with_config({
				telescope = true,
				indentblankline = true,
				notify = true,
				ts_rainbow = true,
				cmp = true,
				illuminate = true,
				dapui = true,
			})
		end,
	},
}
