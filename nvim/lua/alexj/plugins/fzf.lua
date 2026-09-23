return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "nvim-mini/mini.icons" },
	---@module "fzf-lua"
	---@type fzf-lua.Config|{}
	---@diagnostic disable: missing-fields
	opts = {
		fzf_colors = true,
		defaults = {
			formatter = "path.dirname_first", -- or "path.dirname_first"
		},
	},
	keys = {
		{ "<leader>ff", "<cmd>FzfLua files<CR>", desc = "Find Files" },
		{ "<leader>fg", "<cmd>FzfLua grep_visual<CR>", desc = "Grep" },
		--{ "<leader>fb", "<cmd>FzfLua buffers<CR>", desc = "Buffers" },
		{ "<leader>fh", "<cmd>FzfLua<CR>", desc = "FzfLua Menu" },
	},
	---@diagnostic enable: missing-fields
}
