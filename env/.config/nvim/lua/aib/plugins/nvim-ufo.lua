return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		config = function()
			vim.o.foldcolumn = "1"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true

			local ufo = require("ufo")

			ufo.setup({
				provider_selector = function(_, _, _)
					return { "treesitter", "indent" }
				end,
				fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
					local newVirtText = {}
					local suffix = ("   %d lines"):format(endLnum - lnum)
					local sufWidth = vim.fn.strdisplaywidth(suffix)
					local targetWidth = width - sufWidth
					local curWidth = 0

					for _, chunk in ipairs(virtText) do
						local chunkText = chunk[1]
						local hlGroup = chunk[2]
						if curWidth + vim.fn.strdisplaywidth(chunkText) < targetWidth then
							table.insert(newVirtText, { chunkText, hlGroup })
						else
							chunkText = truncate(chunkText, targetWidth - curWidth)
							table.insert(newVirtText, { chunkText, hlGroup })
							chunkText = ""
						end
						curWidth = curWidth + vim.fn.strdisplaywidth(chunkText)
						if curWidth >= targetWidth then
							break
						end
					end

					-- Add suffix with a different highlight
					table.insert(newVirtText, { suffix, "MoreMsg" })
					return newVirtText
				end,
			})

			-- Make folded text look like normal text
			vim.api.nvim_set_hl(0, "Folded", { link = "Normal" })
		end,
	},
}
