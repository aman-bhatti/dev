require("aib.core")
require("aib.lazy")
vim.opt.termguicolors = true
vim.o.guifont = "SpaceMono\\ Nerd\\ Font\\ 50"

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
	},
})

require("bufferline").setup({})

--vim.cmd.colorscheme 'tokyonight'
--vim.cmd([[colorscheme rose-pine-moon]])
--vim.cmd("colorscheme flexoki-dark")
vim.cmd("colorscheme base16-black-metal")

vim.cmd([[highlight Comment gui=bold]])
vim.cmd([[highlight Keyword gui=bold]])
vim.cmd([[highlight @tag.builtin gui=bold]])
vim.cmd([[highlight @keyword.import.tsx gui=bold]])
