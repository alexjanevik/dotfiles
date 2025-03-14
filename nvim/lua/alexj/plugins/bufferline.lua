return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
	version = "*",
	opts = {
		options = {
			mode = "buffers",
			separator_style = { "", "" },
			modified_icon = "●",
			buffer_close_icon = "",
			show_buffer_close_icons = true,
			color_icons = true,

			name_formatter = function(buf)
				return vim.fn.fnamemodify(buf.name, ":p:.")
			end,

			style_preset = 4,

			enforce_regular_tabs = false,

			hover = {
				enabled = true,
				delay = 0,
				reveal = { "close" },
			},

			offsets = {
				{
					filetype = "NvimTree",
					text = "NvimTree",
					text_align = "center",
					highlight = "Directory",
				},
			},
		},
	},
}
