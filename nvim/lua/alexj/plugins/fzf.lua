return {
	"ibhagwan/fzf-lua",
	lazy = false,
	dependencies = { "nvim-mini/mini.icons" },
	---@module "fzf-lua"
	---@type fzf-lua.Config|{}
	---@diagnostic disable: missing-fields
	opts = {
		file_icons = "mini",
		fzf_colors = true,
		defaults = {
			formatter = "path.dirname_first", -- or "path.dirname_first"
		},
	},
	---@diagnostic enable: missing-fields
	config = function(_, opts)
		local fzf = require("fzf-lua")
		fzf.setup(opts)
		fzf.register_ui_select()
	end,
}
