-- For `plugins/markview.lua` users.
return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	priority = 49,
	config = function()
		-- STEP 1: Define our function that links Markview's groups to your theme.
		local function apply_adaptive_highlights()
			local set_hl = vim.api.nvim_set_hl

			-- === Link Headings ===
			-- This makes heading colors adapt to your colorscheme.
			set_hl(0, "MarkviewHeading1", { link = "Title" })
			set_hl(0, "MarkviewHeading2", { link = "Statement" })
			set_hl(0, "MarkviewHeading3", { link = "Constant" })
			set_hl(0, "MarkviewHeading4", { link = "String" })
			set_hl(0, "MarkviewHeading5", { link = "Number" })
			set_hl(0, "MarkviewHeading6", { link = "Comment" })

			-- === Link Checkboxes and List Items ===
			-- We link checkbox states to semantic groups for adaptive colors.
			-- Most themes have distinct colors for these diagnostic groups.
			set_hl(0, "MarkviewCheckboxChecked", { link = "DiagnosticOk" }) -- Completed (usually green)
			set_hl(0, "MarkviewCheckboxUnchecked", { link = "DiagnosticError" }) -- To Do (usually red)
			set_hl(0, "MarkviewCheckboxPending", { link = "DiagnosticWarn" }) -- Pending (usually yellow)
			set_hl(0, "MarkviewCheckboxProgress", { link = "DiagnosticInfo" }) -- In Progress (usually blue)
			set_hl(0, "MarkviewCheckboxCancelled", { link = "Comment" }) -- Cancelled (muted)
			set_hl(0, "MarkviewCheckboxStriked", { link = "Comment" }) -- Striked (muted)

			-- You can also theme the bullet points themselves if you wish!
			set_hl(0, "MarkviewListItem", { link = "Identifier" })
		end

		-- STEP 2: Create an autocommand to run our function on every colorscheme change.
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = apply_adaptive_highlights,
			desc = "Apply adaptive Markview highlights",
		})

		-- STEP 3: Run the function once on startup.
		apply_adaptive_highlights()

		-- STEP 4: Your standard Markview setup.
		require("markview").setup({
			conceal = true,
			markdown = {
				headings = {
					shift_width = 1,
				},
			},
		})
	end,
}
