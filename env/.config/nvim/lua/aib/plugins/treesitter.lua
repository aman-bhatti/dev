return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({
				highlight = { enable = true },
				indent = { enable = true },
				ensure_installed = {
					"json",
					"javascript",
					"typescript",
					"tsx",
					"go",
					"yaml",
					"html",
					"css",
					"python",
					"http",
					"prisma",
					"markdown",
					"markdown_inline",
					"svelte",
					"graphql",
					"bash",
					"lua",
					"vim",
					"dockerfile",
					"gitignore",
					"query",
					"vimdoc",
					"c",
					"java",
					"rust",
					"elixir",
					"eex",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
					},
				},
				additional_vim_regex_highlighting = false,
			})

			-- NOTE: All folding logic has been removed from this file.
			-- This prevents conflicts with nvim-ufo, which now manages
			-- all folding behavior for you.

			-- You can keep your cosmetic settings for folds, as they do not conflict.
			vim.opt.fillchars = {
				fold = " ",
				foldopen = "",
				foldclose = "",
				foldsep = " ",
			}

			-- Custom fold text function
			vim.opt.foldtext = "v:lua.MyFoldText()"

			function _G.MyFoldText()
				local line = vim.fn.getline(vim.v.foldstart)
				local lines_count = vim.v.foldend - vim.v.foldstart + 1
				line = line:gsub("^%s+", ""):gsub("%s+$", "")
				return " " .. line .. "  … (" .. lines_count .. " lines)"
			end
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		ft = {
			"html",
			"xml",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"svelte",
		},
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				},
				per_filetype = {
					["html"] = { enable_close = true },
					["typescriptreact"] = { enable_close = true },
				},
			})
		end,
	},
}
