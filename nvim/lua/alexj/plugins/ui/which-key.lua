return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		delay = 0,
		win = {
			wo = {
				winblend = 0,
			},
			padding = { 0, 2 },
		},
		sort = { "alphanum" },
		spec = {
			{ "<leader>t1", "<Plug>(cokeline-focus-1)", hidden = true },
			{ "<leader>t2", "<Plug>(cokeline-focus-2)", hidden = true },
			{ "<leader>t3", "<Plug>(cokeline-focus-3)", hidden = true },
			{ "<leader>t4", "<Plug>(cokeline-focus-4)", hidden = true },
			{ "<leader>t5", "<Plug>(cokeline-focus-5)", hidden = true },
			{ "<leader>t6", "<Plug>(cokeline-focus-6)", hidden = true },
			{ "<leader>t7", "<Plug>(cokeline-focus-7)", hidden = true },
			{ "<leader>t8", "<Plug>(cokeline-focus-8)", hidden = true },
			{ "<leader>t9", "<Plug>(cokeline-focus-9)", hidden = true },

			{ "<leader>f", desc = "Fuzzy Find", icon = "󰈞" },
			{ "<leader>e", desc = "Explorer", icon = "󰙅" },
			{ "<leader>g", desc = "LSP Config", icon = "" },

			{ "<leader>t", desc = "Buffers", icon = "󰓩" },
			{ "<leader>th", desc = "Focus previous buffer", icon = "" },
			{ "<leader>tl", desc = "Focus next buffer", icon = "" },
			{ "<leader>tw", desc = "Close current buffer", icon = "󰅖" },
			{ "<leader>t#", desc = "Focus buffer 1-9", icon = "󰓩" },

			{ "<leader>x", desc = "Diagnostics", icon = "󱖫" },
			{ "<leader>n", desc = "Notifications", icon = "" },
			{ "<leader>c", desc = "Run Code", icon = "" },
			{ "<leader>cp", "<Cmd>!python3 %<CR>", desc = "Run Python", icon = "" },
			{ "<leader>l", desc = "Lazygit", icon = "" },
			{ "<leader>r", desc = "Rename", icon = "󰑕" },
			{ "<leader>gf", desc = "Format file", icon = "󰴑" },
		},
	},
}
