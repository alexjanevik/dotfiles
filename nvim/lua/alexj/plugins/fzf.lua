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
	keys = {
		{ "<leader>ff", "<cmd>FzfLua files<CR>", desc = "Find Files" },
		{ "<leader>fg", "<cmd>FzfLua grep_visual<CR>", desc = "Grep" },
		{ "<leader>fh", "<cmd>FzfLua<CR>", desc = "FzfLua Menu" },
	},
	---@diagnostic enable: missing-fields
}
