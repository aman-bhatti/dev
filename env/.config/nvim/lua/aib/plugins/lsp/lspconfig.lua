return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					-- NOTE: Removed incorrect 'setup' block from here
					library = {
						{ path = "luvit-meta/library", words = { "vim%.uv" } },
						{ path = "/usr/share/awesome/lib/", words = { "awesome" } },
					},
				},
			},
			{ "Bilal2453/luvit-meta", lazy = true },
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			{ "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },
			{ "elixir-tools/elixir-tools.nvim" },
		},
		config = function()
			require("lspconfig").lua_ls.setup({})

			if vim.g.obsidian then
				return
			end

			local capabilities = nil
			if pcall(require, "cmp_nvim_lsp") then
				capabilities = require("cmp_nvim_lsp").default_capabilities()
			end

			local lspconfig = require("lspconfig")

			-- Helper to DRY up root_dir patterns
			local function get_root(patterns, fallback)
				return function(fname)
					return require("lspconfig.util").root_pattern(unpack(patterns))(fname) or fallback or vim.loop.cwd()
				end
			end

			local servers = {
				bashls = true,
				gopls = {
					manual_install = true,
					settings = {
						gopls = {
							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								functionTypeParameters = true,
								parameterNames = true,
								rangeVariableTypes = true,
							},
						},
					},
				},
				lua_ls = {
					root_dir = get_root({
						".git",
						"lua",
						"init.lua",
						".luarc.json",
						".luacheckrc",
					}),
					server_capabilities = {
						semanticTokensProvider = vim.NIL,
					},
				},
				-- rust_analyzer is still listed here so mason-tool-installer
				-- can ensure it's installed if needed, but mason-lspconfig
				-- will be prevented from setting it up below.
				rust_analyzer = true,
				svelte = true,
				templ = true,
				taplo = true,
				intelephense = true,
				pyright = true,
				ruff = { manual_install = true },
				biome = true,
				vtsls = {
					server_capabilities = {
						documentFormattingProvider = false,
					},
				},
				jsonls = {
					root_dir = get_root({
						".git",
						"package.json",
						"tsconfig.json",
					}),
					server_capabilities = {
						documentFormattingProvider = false,
					},
					settings = {
						json = {
							validate = { enable = true },
						},
					},
				},
				ols = {},
				racket_langserver = { manual_install = true },
				roc_ls = { manual_install = true },
				gleam = {
					manual_install = true,
				},
				lexical = {
					cmd = { "/home/tjdevries/.local/share/nvim/mason/bin/lexical", "server" },
					root_dir = get_root({ "mix.exs" }),
					server_capabilities = {
						completionProvider = vim.NIL,
						definitionProvider = true,
					},
				},
				clangd = {
					init_options = { clangdFileStatus = true },
					filetypes = { "c" },
				},
				tailwindcss = {
					init_options = {
						userLanguages = {
							elixir = "phoenix-heex",
							eruby = "erb",
							heex = "phoenix-heex",
						},
					},
				},
			}

			local servers_to_install = vim.tbl_filter(function(key)
				local t = servers[key]
				if type(t) == "table" then
					return not t.manual_install
				else
					return t
				end
			end, vim.tbl_keys(servers))

			require("mason").setup()
			local ensure_installed = {
				"stylua",
				"lua_ls",
				"delve",
			}

			vim.list_extend(ensure_installed, servers_to_install)
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			-- *** ADDED THIS BLOCK ***
			-- Prevent mason-lspconfig from setting up rust_analyzer
			-- because rustaceanvim handles it.
			require("mason-lspconfig").setup_handlers({
				["rust_analyzer"] = function()
					-- Do nothing. Let rustaceanvim handle setup.
				end,
				-- Default handler for other servers:
				-- function(server_name)
				--   require("lspconfig")[server_name].setup({
				--     capabilities = capabilities,
				--     -- Add other default configurations here if needed
				--   })
				-- end,
			})
			-- *** END OF ADDED BLOCK ***

			-- This loop will now skip rust_analyzer because of the handler above
			for name, config in pairs(servers) do
				if config == true then
					config = {}
				end
				config = vim.tbl_deep_extend("force", {}, {
					capabilities = capabilities,
				}, config)

				-- Check if rust_analyzer to avoid setting it up here
				-- (setup_handlers should prevent this, but double-checking doesn't hurt)
				if name ~= "rust_analyzer" then
					lspconfig[name].setup(config)
				end
			end

			local disable_semantic_tokens = {
				lua = true,
			}

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
					local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

					-- *** IMPORTANT: Check if the client is rust_analyzer managed by rustaceanvim ***
					-- rustaceanvim might handle keymaps and settings differently.
					-- You might need to conditionally apply the keymaps below
					-- or configure them within rustaceanvim's settings instead.
					-- For now, we apply them to all attached LSPs *except* potentially rust_analyzer
					-- if rustaceanvim sets its own. Check rustaceanvim docs for recommended setup.

					-- Example: Only set these keymaps if NOT rust_analyzer (or configure via rustaceanvim)
					-- if client.name ~= "rust_analyzer" then
					local settings = servers[client.name]
					if type(settings) ~= "table" then
						settings = {}
					end

					local builtin = require("telescope.builtin")

					vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
					vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = bufnr })
					vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = bufnr })
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr })
					vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = bufnr })
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })

					vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { buffer = bufnr })
					vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { buffer = bufnr })
					vim.keymap.set("n", "<space>wd", builtin.lsp_document_symbols, { buffer = bufnr })
					-- end -- End of conditional keymap block example

					local filetype = vim.bo[bufnr].filetype
					if disable_semantic_tokens[filetype] then
						client.server_capabilities.semanticTokensProvider = nil
					end

					-- Override server capabilities (ensure this doesn't conflict with rustaceanvim)
					if settings and settings.server_capabilities then
						for k, v in pairs(settings.server_capabilities) do
							if v == vim.NIL then
								v = nil
							end
							client.server_capabilities[k] = v
						end
					end
				end,
			})

			require("lsp_lines").setup()
			vim.diagnostic.config({ virtual_text = true, virtual_lines = false })

			vim.keymap.set("", "<leader>l", function()
				local config = vim.diagnostic.config() or {}
				if config.virtual_text then
					vim.diagnostic.config({ virtual_text = false, virtual_lines = true })
				else
					vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
				end
			end, { desc = "Toggle lsp_lines" })
		end,
	},
}
