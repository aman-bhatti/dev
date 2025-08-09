-- Place this in your ftplugin/markdown.lua

local set = vim.opt_local

set.textwidth = 80 -- Wrap text at 80 characters
set.spell = true -- Enable spell checking
set.linebreak = true

-- Define the foreground colors you want to use for your headings.
-- The background will now be inherited from your colorscheme.
local h1_fg = "#D3869B" -- Formerly color2_fg
-- local h1_bg = "#1F2335" -- Formerly color_fg, used for the H1 banner
local h2_fg = "#4fd6be"
local h3_fg = "#7dcfff"
local h4_fg = "#ff9e64"
local h5_fg = "#7aa2f7"
local h6_fg = "#c0caf5"

-- Set the highlight groups

-- @markup.heading.1 is special: it creates a solid banner effect.
-- We keep the explicit background here as it seems intentional.
vim.cmd(string.format([[highlight @markup.heading.1.markdown cterm=bold gui=bold guifg=%s guibg=NONE]], h1_fg))

-- For headings 2-6, we set guibg=NONE to make the background transparent.
vim.cmd(string.format([[highlight @markup.heading.2.markdown cterm=bold gui=bold guifg=%s guibg=NONE]], h2_fg))
vim.cmd(string.format([[highlight @markup.heading.3.markdown cterm=bold gui=bold guifg=%s guibg=NONE]], h3_fg))
vim.cmd(string.format([[highlight @markup.heading.4.markdown cterm=bold gui=bold guifg=%s guibg=NONE]], h4_fg))
vim.cmd(string.format([[highlight @markup.heading.5.markdown cterm=bold gui=bold guifg=%s guibg=NONE]], h5_fg))
vim.cmd(string.format([[highlight @markup.heading.6.markdown cterm=bold gui=bold guifg=%s guibg=NONE]], h6_fg))
