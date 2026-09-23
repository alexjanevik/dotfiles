return {
	"lmantw/themify.nvim",

	lazy = false,
	priority = 1000,

	config = function()
		require("themify").setup({
			"catppuccin/nvim",
			"olimorris/onedarkpro.nvim",
			"folke/tokyonight.nvim",
			"sainnhe/gruvbox-material",
			"ellisonleao/gruvbox.nvim",
			"Mofiqul/dracula.nvim",
		})
	end,
}
