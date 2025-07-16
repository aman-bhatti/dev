return {
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			animation = false,

			-- Enable/disable current/total tabpages indicator (top right corner)
			tabpages = true,

			-- A buffer to this direction will be focused (if it exists) when closing the current buffer.
			-- Valid options are 'left' (the default), 'previous', and 'right'
			focus_on_close = "left",

			-- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
			hide = { extensions = false, inactive = false },

			icons = {
				buffer_index = false,
				buffer_number = false,
				button = "",
				diagnostics = {
					[vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
				},
				gitsigns = {
					added = { enabled = true, icon = " " },
					changed = { enabled = true, icon = " " },
					deleted = { enabled = true, icon = " " },
				},
				separator = { left = "▎", right = "" },

				-- If true, add an additional separator at the end of the buffer list
				separator_at_end = true,

				-- Configure the icons on the bufferline when modified or pinned.
				-- Supports all the base icon options.
				modified = { button = "●" },
				pinned = { button = "", filename = true },

				-- Configure the icons on the bufferline based on the visibility of a buffer.
				-- Supports all the base icon options, plus `modified` and `pinned`.
				alternate = { filetype = { enabled = false } },
				current = { buffer_index = true },
				inactive = { button = "×" },
				visible = { modified = { buffer_number = false } },
			},

			sidebar_filetypes = { -- Set the filetypes which barbar will offset itself for
				-- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
				NvimTree = true,
				-- Or, specify the text used for the offset:
				undotree = {
					text = "undotree",
					align = "left", -- *optionally* specify an alignment (either 'left', 'center', or 'right')
				},
				-- Or, specify the event which the sidebar executes when leaving:
				["neo-tree"] = { event = "BufWipeout" },
				-- Or, specify all three
				Outline = { event = "BufWinLeave", text = "symbols-outline", align = "right" },
			},
			maximum_length = 25, -- Sets the maximum buffer name length.
			-- 		animation = true,
			-- 		auto_hide = false,
			-- 		tabpages = true,
			-- 		clickable = true,
			-- 		exclude_ft = { "javascript" },
			-- 		exclude_name = { "package.json" },
			-- 		focus_on_close = "left",
			-- 		hide = { extensions = true, inactive = false },
			-- 		highlight_alternate = false,
			-- 		highlight_inactive_file_icons = false,
			-- 		highlight_visible = true,
			-- 		icons = {
			-- 			buffer_index = true,
			-- 			buffer_number = false,
			-- 			button = "",
			-- 			diagnostics = {
			-- 				[vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
			-- 				[vim.diagnostic.severity.WARN] = { enabled = false },
			-- 				[vim.diagnostic.severity.INFO] = { enabled = false },
			-- 				[vim.diagnostic.severity.HINT] = { enabled = true },
			-- 			},
			-- 			gitsigns = {
			-- 				added = { enabled = true, icon = "+" },
			-- 				changed = { enabled = true, icon = "~" },
			-- 				deleted = { enabled = true, icon = "-" },
			-- 			},
			-- 			filetype = { custom_colors = false, enabled = true },
			-- 			separator = { left = "| ", right = "" },
			-- 			separator_at_end = true,
			-- 			modified = { button = "●" },
			-- 			pinned = { button = "", filename = true },
			-- 			preset = "default",
			-- 			alternate = { filetype = { enabled = false } },
			-- 			current = { buffer_index = true },
			-- 			inactive = { button = "×" },
			-- 			visible = { modified = { buffer_number = false } },
			-- 		},
			-- 		insert_at_end = false,
			-- 		insert_at_start = false,
			-- 		maximum_padding = 1,
			-- 		minimum_padding = 1,
			-- 		maximum_length = 30,
			-- 		minimum_length = 0,
			-- 		semantic_letters = true,
			-- 		sidebar_filetypes = {
			-- 			NvimTree = true,
			-- 			undotree = { text = "undotree", align = "center" },
			-- 			["neo-tree"] = { event = "BufWipeout" },
			-- 			Outline = { event = "BufWinLeave", text = "symbols-outline", align = "right" },
			-- 		},
			-- 		letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
			-- 		no_name_title = nil,
			-- 		sort = { ignore_case = true },
			-- 	},
			-- 	version = "^1.0.0",
		},
	},
}
