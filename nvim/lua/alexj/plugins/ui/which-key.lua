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
				{ "<leader>t", group = "Buffers", icon = "󰓩 " },
				{ "<leader>th", "<plug>(cokeline-focus-prev)", desc = "Focus previous buffer", icon = " " },
				{ "<leader>tl", "<plug>(cokeline-focus-next)", desc = "Focus next buffer", icon = " " },
				{ "<leader>tw", "<cmd>bdelete<cr>", desc = "Close current buffer", icon = "󰭌 " },
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

			-- Fuzzy Find
			{
				{ "<leader>f", group = "Fuzzy Find", icon = "󰮗 " },
				{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files", icon = "󰤏 " },
				{ "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep", icon = "󱩾 " },
				{ "<leader>fh", "<cmd>FzfLua<cr>", desc = "FzfLua Menu", icon = "󰮫 " },
			},

			-- Snacks
			{
				{
					"<leader>e",
					function()
						Snacks.explorer()
					end,
					desc = "Explorer",
					icon = "󰙅 ",
				},
				{
					"<leader>n",
					function()
						Snacks.picker.notifications()
					end,
					desc = "Notifications",
					icon = " ",
				},
			},

			-- LSP
			{
				{ "<leader>g", group = "LSP", icon = " " },
				{
					"<leader>gd",
					"<cmd>FzfLua lsp_definitions<cr>",
					desc = "Go to definition",
					icon = " ",
				},
				{
					"<leader>gr",
					"<cmd>FzfLua lsp_references<cr>",
					desc = "References",
					icon = " ",
				},
				{
					"<leader>gi",
					"<cmd>FzfLua lsp_implementations<cr>",
					desc = "Implementations",
					icon = "󰆧 ",
				},
				{
					"<leader>gn",
					function()
						vim.lsp.buf.rename()
					end,
					desc = "Rename symbol",
					icon = " ",
				},
				{
					"<leader>gf",
					function()
						require("conform").format({ lsp_format = "fallback", async = false, timeout_ms = 1000 })
					end,
					mode = { "n", "v" },
					desc = "Format file",
					icon = "󰴑 ",
				},
				{
					"<leader>ga",
					"<cmd>FzfLua lsp_code_actions<cr>",
					desc = "Code action",
					icon = " ",
				},
			},

			-- Diagnostics
			{
				{ "<leader>x", group = "Diagnostics", icon = "󰒡 " },
				{
					"<leader>xw",
					"<cmd>FzfLua diagnostics_workspace<cr>",
					desc = "Diagnostics (Workspace)",
				},
				{
					"<leader>xx",
					"<cmd>FzfLua diagnostics_document<cr>",
					desc = "Diagnostics (Document)",
				},
			},

			-- Git
			{
				{ "<leader>l", group = "Git", icon = " " },
				{
					"<leader>lg",
					function()
						Snacks.lazygit()
					end,
					desc = "Lazygit",
					icon = " ",
				},
				{ "<leader>lc", "<cmd>FzfLua git_commits<cr>", desc = "Git commits", icon = " " },
				{ "<leader>lb", "<cmd>FzfLua git_branches<cr>", desc = "Git branches", icon = " " },
				{ "<leader>ls", "<cmd>FzfLua git_status<cr>", desc = "Git status", icon = "󱖫 " },
				{ "<leader>lt", "<cmd>FzfLua git_stash<cr>", desc = "Git stash", icon = " " },
				{ "<leader>ld", "<cmd>FzfLua git_diff<cr>", desc = "Git diff", icon = " " },
			},
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
	end,
}
