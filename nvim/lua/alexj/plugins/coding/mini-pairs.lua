return {
	"nvim-mini/mini.pairs",
	event = "InsertEnter",
	opts = {},
	config = function(_, opts)
		local pairs = require("mini.pairs")
		pairs.setup(opts)

		vim.keymap.set("i", "<CR>", function()
			if vim.fn.pumvisible() == 1 and vim.fn.complete_info({ "selected" }).selected ~= -1 then
				return vim.api.nvim_replace_termcodes("<C-y>", true, false, true)
			end
			local cancel = vim.fn.pumvisible() == 1
				and vim.api.nvim_replace_termcodes("<C-e>", true, false, true) or ""
			return cancel .. pairs.cr()
		end, { expr = true, replace_keycodes = false, desc = "Accept completion or insert paired newline" })
	end,
}
