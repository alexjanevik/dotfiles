return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
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
			view_history = "popup",
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
}
