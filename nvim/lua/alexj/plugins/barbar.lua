return {
	"romgrk/barbar.nvim",
	event = "BufReadPre",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		animation = true,
		auto_hide = true,
		tabpages = true,

		icons = {
			-- Configure the base icons on the bufferline.
			-- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
			buffer_index = true,
			button = "",
			-- Enables / disables diagnostic symbols
			diagnostics = {
				[vim.diagnostic.severity.ERROR] = { enabled = true },
				[vim.diagnostic.severity.WARN] = { enabled = false },
				[vim.diagnostic.severity.INFO] = { enabled = false },
				[vim.diagnostic.severity.HINT] = { enabled = true },
			},
			gitsigns = {
				added = { enabled = true, icon = "+" },
				changed = { enabled = true, icon = "~" },
				deleted = { enabled = true, icon = "-" },
			},
			filetype = {
				enabled = true,
			},
			-- If true, add an additional separator at the end of the buffer list
			separator_at_end = false,

			-- Configure the icons on the bufferline when modified or pinned.
			-- Supports all the base icon options.
			modified = { button = "●" },

			-- Configure the icons on the bufferline based on the visibility of a buffer.
			-- Supports all the base icon options, plus `modified` and `pinned`.
			current = { buffer_index = true },
		},
	},
	keys = {
		{ "<leader>tw", "<cmd>BufferClose<cr>", desc = "Close buffer" },

		{ "<leader>t1", "<Cmd>BufferGoto 1<CR>", desc = "Go to buffer 1" },
		{ "<leader>t2", "<Cmd>BufferGoto 2<CR>", desc = "Go to buffer 2" },
		{ "<leader>t3", "<Cmd>BufferGoto 3<CR>", desc = "Go to buffer 3" },
		{ "<leader>t4", "<Cmd>BufferGoto 4<CR>", desc = "Go to buffer 4" },
		{ "<leader>t5", "<Cmd>BufferGoto 5<CR>", desc = "Go to buffer 5" },
		{ "<leader>t6", "<Cmd>BufferGoto 6<CR>", desc = "Go to buffer 6" },
		{ "<leader>t7", "<Cmd>BufferGoto 7<CR>", desc = "Go to buffer 7" },
		{ "<leader>t8", "<Cmd>BufferGoto 8<CR>", desc = "Go to buffer 8" },
		{ "<leader>t9", "<Cmd>BufferGoto 9<CR>", desc = "Go to buffer 9" },

		{ "<leader>t,", "<Cmd>BufferMovePrevious<CR>", desc = "Move buffer to the left" },
		{ "<leader>t.", "<Cmd>BufferMoveNext<CR>", desc = "Move buffer to the right" },
	},
}
