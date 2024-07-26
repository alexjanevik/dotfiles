return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = "catppuccin",
				component_separators = "",
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "NvimTree" },
			},
			tabline = {},
			sections = {
				lualine_a = {
					{
						"mode",
						icons_enabled = true,
						icon = "",
					},
				},
				lualine_c = {
					{
						"filename",
						path = 1,
					},
					{
						"filetype",
						icon_only = true,
						colored = false,
					},
				},

				lualine_x = {
					--[[
          {
						lazy_status.updates,
						cond = lazy_status.has_updates,
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype", icon_only = true },
          --]]
				},
			},
		})
	end,
}
