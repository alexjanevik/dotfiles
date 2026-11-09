return {
	"folke/which-key.nvim",
	lazy = false,
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
			-- Group names and icons only; the mappings are in config/keymaps.lua.
			-- Buffers
			{ "<leader>b", group = "Buffers", icon = " " },
			{ "<leader>bh", icon = " " },
			{ "<leader>bl", icon = " " },
			{ "<leader>bw", icon = "󰭌 " },
			{ "<leader>b#", desc = "Focus buffer 1-9", icon = "󱦞 " },
			{ "<leader>b1", hidden = true },
			{ "<leader>b2", hidden = true },
			{ "<leader>b3", hidden = true },
			{ "<leader>b4", hidden = true },
			{ "<leader>b5", hidden = true },
			{ "<leader>b6", hidden = true },
			{ "<leader>b7", hidden = true },
			{ "<leader>b8", hidden = true },
			{ "<leader>b9", hidden = true },

			-- Find
			{ "<leader>f", group = "Find", icon = " " },
			{ "<leader>ff", icon = "󰱽 " },
			{ "<leader>fg", icon = "󰺯 " },
			{ "<leader>fp", icon = " " },
			{ "<leader>fb", icon = " " },
			{ "<leader>fr", icon = "󰋚 " },
			{ "<leader>fs", icon = "󰧑 " },

			-- Snacks
			{ "<leader>e", icon = "󰙅 " },
			{ "<leader>n", icon = " " },

			-- LSP
			{ "<leader>g", group = "LSP", icon = " " },
			{ "<leader>gd", icon = " " },
			{ "<leader>gr", icon = " " },
			{ "<leader>gi", icon = "󰆧 " },
			{ "<leader>gn", icon = " " },
			{ "<leader>ga", icon = " " },
			{ "<leader>gs", group = "Symbols", icon = "󰊕 " },
			{ "<leader>gss", icon = "󰊕 " },
			{ "<leader>gsw", icon = "󰊕 " },

			-- Diagnostics
			{ "<leader>x", group = "Diagnostics", icon = "󰒡 " },

			-- Git
			{ "<leader>l", group = "Git", icon = " " },
			{ "<leader>lg", icon = " " },
			{ "<leader>lb", icon = " " },
			{ "<leader>ls", icon = "󱖫 " },
			{ "<leader>lx", icon = " " },
			{ "<leader>ld", icon = " " },
			{ "<leader>ll", icon = " " },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
	end,
}
