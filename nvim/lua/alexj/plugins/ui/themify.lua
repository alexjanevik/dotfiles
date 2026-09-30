return {
	"lmantw/themify.nvim",

	lazy = false,
	priority = 1000,

	config = function()
		require("themify").setup({
			"catppuccin/nvim",
			"olimorris/onedarkpro.nvim",
			"folke/tokyonight.nvim",
			{
				"sainnhe/gruvbox-material",
				before = function()
					vim.g.gruvbox_material_background = "medium"
					vim.g.gruvbox_material_transparent_background = 2
					vim.g.gruvbox_material_dim_inactive_windows = 1
				end,
			},
			"ellisonleao/gruvbox.nvim",
			"Mofiqul/dracula.nvim",
		})
	end,
}
