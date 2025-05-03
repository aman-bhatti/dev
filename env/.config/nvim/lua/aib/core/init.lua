require("aib.core.remap")
require("aib.core.set")

vim.api.nvim_set_hl(0, "MyBoldText", { bold = true })

vim.cmd([[highlight Comment gui=bold]])
-- Link MyBoldText to a specific syntax group or text element
