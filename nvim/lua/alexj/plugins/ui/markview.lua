return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	dependencies = {
		"saghen/blink.cmp",
	},

	init = function()
		-- Set the global variable BEFORE the plugin loads
		vim.g.markview_alpha = 0.00
	end,

	config = function()
		local presets = require("markview.presets")

		require("markview").setup({
			markdown = {
				headings = presets.headings.simple,
				block_quotes = presets.block_quotes.obsidian,
			},
		})
	end,
}
