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

-- obsidian-nvim bindings --
map("n", "<leader>oo", "<cmd>ObsidianOpen<cr>", opts)
map("n", "<leader>on", "<cmd>ObsidianNew<cr>", opts)
map("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", opts)
map("n", "<leader>of", "<cmd>ObsidianFollowLink<cr>", opts)
map("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", opts)
map("n", "<leader>ot", "<cmd>ObsidianTags<cr>", opts)
map("n", "<leader>od", "<cmd>ObsidianToday<cr>", opts)
map("n", "<leader>oy", "<cmd>ObsidianYesterday<cr>", opts)
map("n", "<leader>om", "<cmd>ObsidianTomorrow<cr>", opts)
map("n", "<leader>oa", "<cmd>ObsidianDailies<cr>", opts)
map("n", "<leader>op", "<cmd>ObsidianTemplate<cr>", opts)
map("n", "<leader>os", "<cmd>ObsidianSearch<cr>", opts)
map("n", "<leader>ol", "<cmd>ObsidianLink<cr>", opts)
map("n", "<leader>ok", "<cmd>ObsidianLinkNew<cr>", opts)
map("n", "<leader>oi", "<cmd>ObsidianLinks<cr>", opts)
map("v", "<leader>oe", "<cmd>ObsidianExtractNote<cr>", opts) -- visual mode
map("n", "<leader>ow", "<cmd>ObsidianWorkspace<cr>", opts)
map("n", "<leader>og", "<cmd>ObsidianPasteImg<cr>", opts)
map("n", "<leader>or", "<cmd>ObsidianRename<cr>", opts)
map("n", "<leader>ox", "<cmd>ObsidianToggleCheckbox<cr>", opts)
map("n", "<leader>oz", "<cmd>ObsidianNewFromTemplate<cr>", opts)
map("n", "<leader>oc", "<cmd>ObsidianTOC<cr>", opts)
-- Link to existing note
vim.keymap.set("v", "<leader>ol", ":ObsidianLink<CR>", { desc = "Link to note" })

-- Create new note and link
vim.keymap.set("v", "<leader>ok", ":ObsidianLinkNew<CR>", { desc = "Link to new note" })
