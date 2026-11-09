return {
	"lmantw/themify.nvim",
	lazy = false,
	priority = 1000,

	config = function()
		require("themify").setup({
			{
				"colourme",
				after = function()
					vim.api.nvim_set_hl(0, "SnacksPickerListCursorLine", { bg = "#1D2021" })
				end,
			},
			"catppuccin/nvim",
			"olimorris/onedarkpro.nvim",
			"folke/tokyonight.nvim",
			{
				"sainnhe/gruvbox-material",
				before = function()
					vim.g.gruvbox_material_background = "hard"
					vim.g.gruvbox_material_foreground = "material"
					vim.g.gruvbox_material_transparent_background = 2
					vim.g.gruvbox_material_dim_inactive_windows = 1
				end,
				after = function()
					vim.api.nvim_set_hl(0, "SnacksPickerListCursorLine", { bg = "#1D2021" })
				end,
			},
			"ellisonleao/gruvbox.nvim",
			"Mofiqul/dracula.nvim",
		})
	end,
}
