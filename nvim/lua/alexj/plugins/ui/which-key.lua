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
			{ "<leader>ts1", "<Plug>(cokeline-focus-1)", hidden = true },
			{ "<leader>ts2", "<Plug>(cokeline-focus-2)", hidden = true },
			{ "<leader>ts3", "<Plug>(cokeline-focus-3)", hidden = true },
			{ "<leader>ts4", "<Plug>(cokeline-focus-4)", hidden = true },
			{ "<leader>ts5", "<Plug>(cokeline-focus-5)", hidden = true },
			{ "<leader>ts6", "<Plug>(cokeline-focus-6)", hidden = true },
			{ "<leader>ts7", "<Plug>(cokeline-focus-7)", hidden = true },
			{ "<leader>ts8", "<Plug>(cokeline-focus-8)", hidden = true },
			{ "<leader>ts9", "<Plug>(cokeline-focus-9)", hidden = true },

			{ "<leader>f", desc = "Fuzzy Find", icon = "󰈞" },
			{ "<leader>e", desc = "Explorer", icon = "󰙅" },
			{ "<leader>g", desc = "LSP Config", icon = "" },
			{ "<leader>t", desc = "Tabs", icon = "󰓩" },
			{ "<leader>ts", desc = "Switch Tabs", icon = "󰓩" },
			{ "<leader>x", desc = "Diagnostics", icon = "󱖫" },
			{ "<leader>n", desc = "Notifications", icon = "" },

			{ "<leader>c", desc = "Run Code", icon = "" },
			{ "<leader>cp", "<Cmd>!python3 %<CR>", desc = "Run Python", icon = "" },
			{ "<leader>l", desc = "Lazygit", icon = "" },
		},
	},
}
