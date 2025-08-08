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
