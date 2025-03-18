return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		preset = "helix",
		win = {
			padding = { 2, 4 },
		},
		spec = {
			-- Hide mappings for switching buffers
			{ "<leader>1", "<Cmd>BufferGoto 1<CR>", hidden = true },
			{ "<leader>2", "<Cmd>BufferGoto 2<CR>", hidden = true },
			{ "<leader>3", "<Cmd>BufferGoto 3<CR>", hidden = true },
			{ "<leader>4", "<Cmd>BufferGoto 4<CR>", hidden = true },
			{ "<leader>5", "<Cmd>BufferGoto 5<CR>", hidden = true },
			{ "<leader>6", "<Cmd>BufferGoto 6<CR>", hidden = true },
			{ "<leader>7", "<Cmd>BufferGoto 7<CR>", hidden = true },
			{ "<leader>8", "<Cmd>BufferGoto 8<CR>", hidden = true },
			{ "<leader>9", "<Cmd>BufferGoto 9<CR>", hidden = true },

			{ "<leader>f", desc = "Fuzzy Find", icon = "" },
			{ "<leader>e", desc = "Explorer" },
			{ "<leader>g", desc = "LSP Config", icon = "" },
			{ "<leader>l", desc = "LazyGit", icon = "󰊢" },
			{ "<leader>s", desc = "Window splitting", icon = "" },
			{ "<leader>t", desc = "Tabs", icon = "󰓩" },
			{ "<leader>x", desc = "Diagnostics", icon = "󱖫" },
		},
	},
}
