return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
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
		-- Make filenames match the title exactly
		note_id_func = function(title)
			if title ~= nil then
				return title:gsub(" ", "-")
			else
				return "untitled"
			end
		end,
	},
}
