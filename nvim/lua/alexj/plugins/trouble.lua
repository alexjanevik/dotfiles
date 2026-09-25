return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	opts = {
		focus = true,
		modes = {
			diagnostics = {
				warn_no_results = true,
				open_no_results = false,
				win = {
					type = "float",
					focus = true,
					border = "rounded",
					title = "Diagnostics",
					title_pos = "center",
					--position = "bottom",
					--size = { height = 10 },
				},
			},
		},
	}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	keys = {
		{ "<leader>xd", "<cmd>Trouble<CR>", desc = "Open/close Trouble list" },
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics" },
		{ "<leader>xq", "<cmd>Trouble quickfix<CR>", desc = "Quickfix List" },
		{ "<leader>xl", "<cmd>Trouble loclist<CR>", desc = "Location List" },
	},
}
