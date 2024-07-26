return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
	version = "*",
	opts = {
		options = {
			mode = "buffers",
			separator_style = "thin",
			modified_icon = "●",
			buffer_close_icon = "",
			show_buffer_close_icons = true,
			name_formatter = function(buf)
				return vim.fn.fnamemodify(buf.name, ":p:.")
			end,

			hover = {
				enabled = true,
				delay = 0,
				reveal = { "close" },
			},

			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "center",
					highlight = "Directory",
				},
			},
		},
	},
}
