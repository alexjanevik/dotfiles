return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	opts = {
		modes = {
			diagnostics = {
				warn_no_results = false,
				open_no_results = true,
				win = {
					position = "bottom",
					size = { height = 10 },
				},
			},
		},
	}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	keys = {
		{ "<leader>xx", "<cmd>Trouble<CR>", desc = "Open/close Trouble list" },
		{ "<leader>xd", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)" },
		{ "<leader>xq", "<cmd>Trouble quickfix<CR>", desc = "Quickfix List (Trouble)" },
		{ "<leader>xl", "<cmd>Trouble loclist<CR>", desc = "Location List (Trouble)" },
	},
}
