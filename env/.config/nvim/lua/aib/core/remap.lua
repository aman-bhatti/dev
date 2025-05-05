vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>th", ":Telescope colorscheme<CR>")

vim.keymap.set("n", "<C-ft>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.api.nvim_set_keymap("v", "<leader>cy", '"+y', { noremap = true, silent = true })

--- this is to hit jj for esc ---
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })

-- diagnostic
vim.api.nvim_set_keymap(
	"n",
	"[e",
	"<cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"]e",
	"<cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>",
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })

-- keybinds to move around
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-f>", "<C-f>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-b>", "<C-b>", { noremap = true, silent = true })

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

for i = 1, 9 do
	map("n", string.format("<leader>%d", i), string.format("<Cmd>BufferGoto %d<CR>", i), {
		desc = string.format("Go to buffer %d", i),
		silent = true,
	})
end

map("n", "<leader>c", "<Cmd>BufferClose<CR>", { desc = "Close buffer", silent = true })
map("n", "<Tab>", "<Cmd>BufferNext<CR>", { desc = "Next Buffer", noremap = true, silent = true })
map("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", { desc = "Previous buffer", noremap = true, silent = true })
