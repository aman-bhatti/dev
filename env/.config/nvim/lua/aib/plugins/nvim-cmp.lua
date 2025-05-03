return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- LSP source
		"hrsh7th/cmp-buffer", -- buffer source
		"hrsh7th/cmp-path", -- path source
		"saadparwaiz1/cmp_luasnip", -- LuaSnip source
		"rafamadriz/friendly-snippets", -- community snippets
		"onsails/lspkind.nvim", -- VSCode-like pictograms
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- Load friendly snippets
		require("luasnip.loaders.from_vscode").lazy_load()

		-- Custom highlights for completion kinds
		vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#e0af68", bg = "#2c2c2c", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#7aa2f7", bg = "#2c2c2c" })
		vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#bb9af7", bg = "#2c2c2c" })
		vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#9ece6a", bg = "#2c2c2c" })
		vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#f7768e", bg = "#2c2c2c" })

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
					mode = "symbol_text", -- show both symbol and text
					menu = {
						nvim_lsp = "[LSP]",
						luasnip = "[Snippet]",
						buffer = "[Buffer]",
						path = "[Path]",
					},
				}),
			},
		})
	end,
}
