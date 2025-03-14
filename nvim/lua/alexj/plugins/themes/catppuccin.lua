return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		local latte = require("catppuccin.palettes").get_palette("latte")
		local frappe = require("catppuccin.palettes").get_palette("frappe")
		local macchiato = require("catppuccin.palettes").get_palette("macchiato")
		local mocha = require("catppuccin.palettes").get_palette("mocha")

		require("catppuccin").setup({
			flavour = "mocha",
			integrations = {
				treesitter = true,
				bufferline = true,
				cmp = true,
				nvimtree = true,
				telescope = { enabled = true },
			},
		})
		--vim.cmd.colorscheme("catppuccin")
	end,
}
