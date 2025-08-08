return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
				indent = { enable = true },
				ensure_installed = {
					"markdown",
					"markdown_inline",
					"lua",
					"vim",
					"javascript",
					"typescript",
					"html",
					"css",
				},
			})

			-- Default: Treesitter folding
			vim.o.foldmethod = "expr"
			vim.o.foldexpr = "nvim_treesitter#foldexpr()"
			vim.o.foldenable = true

			-- Markdown-specific folding: fold by heading level
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function()
					vim.opt_local.foldmethod = "expr"
					vim.opt_local.foldexpr =
						"getline(v:lnum)=~'^#' ? '>' . len(matchstr(getline(v:lnum), '^#\\+')) : '='"
				end,
			})
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		config = function()
			vim.o.foldcolumn = "1"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true

			require("ufo").setup({
				provider_selector = function(_, filetype, _)
					if filetype == "markdown" then
						-- Use indent provider since Treesitter doesn't fold markdown
						return { "indent" }
					end
					return { "treesitter", "indent" }
				end,
			})
		end,
	},
}
