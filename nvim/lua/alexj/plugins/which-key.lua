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
			-- Buffers
			{
				{ "<leader>t", group = "Buffers", icon = " " },
				{ "<leader>th", "<plug>(cokeline-focus-prev)", desc = "Focus previous buffer", icon = " " },
				{ "<leader>tl", "<plug>(cokeline-focus-next)", desc = "Focus next buffer", icon = " " },
				{
					"<leader>tw",
					function()
						Snacks.bufdelete.delete()
					end,
					desc = "Close current buffer",
					icon = "󰭌 ",
				},
				{ "<leader>t#", desc = "Focus buffer 1-9", icon = "󱦞 " },
				{ -- Focus buffer 1-9
					{ "<leader>t1", "<plug>(cokeline-focus-1)", hidden = true },
					{ "<leader>t2", "<plug>(cokeline-focus-2)", hidden = true },
					{ "<leader>t3", "<plug>(cokeline-focus-3)", hidden = true },
					{ "<leader>t4", "<plug>(cokeline-focus-4)", hidden = true },
					{ "<leader>t5", "<plug>(cokeline-focus-5)", hidden = true },
					{ "<leader>t6", "<plug>(cokeline-focus-6)", hidden = true },
					{ "<leader>t7", "<plug>(cokeline-focus-7)", hidden = true },
					{ "<leader>t8", "<plug>(cokeline-focus-8)", hidden = true },
					{ "<leader>t9", "<plug>(cokeline-focus-9)", hidden = true },
				},
			},

			-- Find
			{
				{ "<leader>f", group = "Find", icon = "󰮗 " },
				{
					"<leader>ff",
					function()
						require("snacks").picker.files()
					end,
					desc = "Files",
					icon = "󰤏 ",
				},
				{
					"<leader>fg",
					function()
						require("snacks").picker.grep()
					end,
					desc = "Grep",
					icon = "󱩾 ",
				},
				{
					"<leader>fh",
					function()
						require("snacks").picker.pickers()
					end,
					desc = "Pickers",
					icon = "󰮫 ",
				},
				{
					"<leader>fb",
					function()
						require("snacks").picker.buffers()
					end,
					desc = "Buffers",
					icon = " ",
				},
				{
					"<leader>fr",
					function()
						require("snacks").picker.recent()
					end,
					desc = "Recent",
					icon = "󰋚 ",
				},
			},

			-- Snacks
			{
				"<leader>e",
				function()
					require("snacks").explorer()
				end,
				desc = "Explorer",
				icon = "󰙅 ",
			},
			{
				"<leader>n",
				function()
					require("snacks").picker.notifications()
				end,
				desc = "Notifications",
				icon = " ",
			},

			-- LSP
			{
				{ "<leader>l", group = "LSP", icon = " " },
				{
					"<leader>ld",
					function()
						require("snacks").picker.lsp_definitions()
					end,
					desc = "Go to definition",
					icon = " ",
				},
				{
					"<leader>lr",
					function()
						require("snacks").picker.lsp_references()
					end,
					desc = "References",
					icon = " ",
				},
				{
					"<leader>li",
					function()
						require("snacks").picker.lsp_implementations()
					end,
					desc = "Implementations",
					icon = "󰆧 ",
				},
				{
					"<leader>ln",
					function()
						vim.lsp.buf.rename()
					end,
					desc = "Rename symbol",
					icon = " ",
				},
				{
					"<leader>la",
					"<cmd>lua vim.lsp.buf.code_action()<cr>",
					desc = "Code action",
					icon = " ",
				},
				{ "<leader>ls", group = "Symbols", icon = "󰊕 " },
				{
					"<leader>lss",
					function()
						require("snacks").picker.lsp_symbols()
					end,
					desc = "Document symbols",
					icon = "󰊕 ",
				},
				{
					"<leader>lsw",
					function()
						require("snacks").picker.lsp_workspace_symbols()
					end,
					desc = "Workspace symbols",
					icon = "󰊕 ",
				},
			},

			-- Diagnostics
			{
				{ "<leader>x", group = "Diagnostics", icon = "󰒡 " },
				{
					"<leader>xw",
					function()
						require("snacks").picker.diagnostics()
					end,
					desc = "Diagnostics (Workspace)",
				},
				{
					"<leader>xx",
					function()
						require("snacks").picker.diagnostics_buffer()
					end,
					desc = "Diagnostics (Document)",
				},
			},

			-- Git
			{
				{ "<leader>g", group = "Git", icon = " " },
				{
					"<leader>glg",
					function()
						require("snacks").lazygit()
					end,
					desc = "Lazygit",
					icon = " ",
				},
				{
					"<leader>gc",
					function()
						require("snacks").picker.git_log()
					end,
					desc = "Git commits",
					icon = " ",
				},
				{
					"<leader>gb",
					function()
						require("snacks").picker.git_branches()
					end,
					desc = "Git branches",
					icon = " ",
				},
				{
					"<leader>gs",
					function()
						require("snacks").picker.git_status()
					end,
					desc = "Git status",
					icon = "󱖫 ",
				},
				{
					"<leader>gx",
					function()
						require("snacks").picker.git_stash()
					end,
					desc = "Git stash",
					icon = " ",
				},
				{
					"<leader>gd",
					function()
						require("snacks").picker.git_diff()
					end,
					desc = "Git diff",
					icon = " ",
				},
				{
					"<leader>gll",
					function()
						require("snacks").picker.git_log()
					end,
					desc = "Git log",
					icon = " ",
				},
			},
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
	end,
}
