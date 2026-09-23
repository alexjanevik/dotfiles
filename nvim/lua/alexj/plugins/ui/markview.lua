return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	dependencies = {
		"saghen/blink.cmp",
	},

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
