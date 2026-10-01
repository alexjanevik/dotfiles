return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		popupmenu = {
			enabled = false, -- mini.completion positions its info window beside the native menu.
		},
		lsp = {
			-- Servers report analysis progress on edits; keep these out of popups.
			progress = { enabled = false },
			signature = {
				auto_open = {
					enabled = false,
				},
			},
		},
		cmdline = {
			enabled = true,
			view = "cmdline",
		},
		notify = {
			enabled = true,
			view = "notify",
		},
		messages = {
			enabled = true,
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
}
