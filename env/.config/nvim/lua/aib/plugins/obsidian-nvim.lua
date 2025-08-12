return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	cmd = { "ObsidianNew", "ObsidianOpen", "ObsidianSearch" },
	lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   "BufReadPre " .. vim.fn.expand "~/Documents/solitude/*.md",
	--   "BufNewFile " .. vim.fn.expand "~/Documents/solitude/*.md",
	-- },
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required
	},
	opts = {
		workspaces = {
			{
				name = "solitude",
				path = "~/Documents/solitude",
			},
		},
		ui = {
			enable = true, -- set to false to disable all additional syntax features
			update_debounce = 200, -- update delay after a text change (in milliseconds)
			max_file_length = 5000, -- disable UI features for files with more than this many lines
			-- Define how various check-boxes are displayed
			checkboxes = {
				-- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
				[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
				["x"] = { char = "", hl_group = "ObsidianDone" },
				[">"] = { char = "", hl_group = "ObsidianRightArrow" },
				["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
				["!"] = { char = "", hl_group = "ObsidianImportant" },
				-- Replace the above with this if you don't have a patched font:
				-- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
				-- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

				-- You can also add more custom ones...
			},
			-- Use bullet marks for non-checkbox lists.
			bullets = { char = "•", hl_group = "ObsidianBullet" },
			external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
			-- Replace the above with this if you don't have a patched font:
			-- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
			reference_text = { hl_group = "ObsidianRefText" },
			highlight_text = { hl_group = "ObsidianHighlightText" },
			tags = { hl_group = "ObsidianTag" },
			block_ids = { hl_group = "ObsidianBlockID" },
			hl_groups = {
				-- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
				ObsidianTodo = { bold = true, fg = "#f78c6c" },
				ObsidianDone = { bold = true, fg = "#89ddff" },
				ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
				ObsidianTilde = { bold = true, fg = "#ff5370" },
				ObsidianImportant = { bold = true, fg = "#d73128" },
				ObsidianBullet = { bold = true, fg = "#89ddff" },
				ObsidianRefText = { underline = true, fg = "#c792ea" },
				ObsidianExtLinkIcon = { fg = "#c792ea" },
				ObsidianTag = { italic = true, fg = "#89ddff" },
				ObsidianBlockID = { italic = true, fg = "#89ddff" },
				ObsidianHighlightText = { bg = "#75662e" },
			},
		},
		daily_notes = {
			-- Optional, if you keep daily notes in a separate directory.
			folder = "01 - DAILY/",
			-- Optional, if you want to change the date format for the ID of daily notes.
			date_format = "%Y-%m-%d",
			-- Optional, if you want to change the date format of the default alias of daily notes.
			alias_format = "%B %-d, %Y",
			-- Optional, default tags to add to each new daily note created.
			default_tags = { "daily-notes" },
			-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
			template = nil,
		},
		templates = {
			folder = "69 - TEMPLATES",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
			-- A map for custom variables, the key should be the variable and the value a function
			substitutions = {},
		},
		picker = {
			-- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
			name = "telescope.nvim",
			-- Optional, configure key mappings for the picker. These are the defaults.
			-- Not all pickers support all mappings.
			note_mappings = {
				-- Create a new note from your query.
				new = "<C-x>",
				-- Insert a link to the selected note.
				insert_link = "<C-l>",
			},
			tag_mappings = {
				-- Add tag(s) to current note.
				tag_note = "<C-x>",
				-- Insert a tag at the current location.
				insert_tag = "<C-l>",
			},
		},
		note_frontmatter_func = function(note)
			local out = {
				id = note.id,
				aliases = {},
				tags = {},
				date = os.date("%Y-%m-%d %I;%M;%S %p"),
			}

			-- Preserve any existing metadata
			if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
				for k, v in pairs(note.metadata) do
					out[k] = v
				end
			end

			return out
		end,
		-- Make filenames match the title exactly
		note_id_func = function(title)
			if title ~= nil then
				return title:gsub(" ", "-")
			else
				return "untitled"
			end
		end,
	},
	config = function(_, opts)
		require("obsidian").setup(opts)
	end,
	-- Move keybind here so it's always available
	keys = {
		{
			"<leader>nl",
			function()
				local title = vim.fn.input("Title: ")
				if title ~= "" then
					local name = title:gsub(" ", "-")
					-- Use ObsidianNewFromTemplate instead and specify your template
					vim.cmd("ObsidianNewFromTemplate " .. "02 - LEETCODE/" .. name)
				else
					print("Note creation cancelled.")
				end
			end,
			desc = "New dated Obsidian note in LEETCODE folder",
		},
		{
			"<leader>nn",
			function()
				local title = vim.fn.input("Title: ")
				if title ~= "" then
					local name = title:gsub(" ", "-")
					-- Explicitly create in root by using "./"
					vim.cmd("ObsidianNew ./" .. name)
				else
					print("Note creation cancelled.")
				end
			end,
			desc = "New note in root",
		},
	},
}
