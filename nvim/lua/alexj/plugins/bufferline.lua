return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			mode = "buffers",
			separator_style = "thick",
			modified_icon = "●",
			buffer_close_icon = "",
			show_buffer_close_icons = true,

			hover = {
				enabled = true,
				delay = 0,
				reveal = { "close" },
			},
		},
	},
}
