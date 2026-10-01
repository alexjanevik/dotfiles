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

		{ "<leader>xw", "<cmd>FzfLua diagnostics_workspace<CR>", desc = "Diagnostics (Workspace)" },
		{ "<leader>xx", "<cmd>FzfLua diagnostics_document<CR>", desc = "Diagnostics (Document)" },

		{ "<leader>gd", "<cmd>FzfLua lsp_definitions<CR>", desc = "Go to definition" },
		{ "<leader>gr", "<cmd>FzfLua lsp_references<CR>", desc = "References" },
		{ "<leader>gi", "<cmd>FzfLua lsp_implementations<CR>", desc = "Implementations" },
		{ "<leader>ca", "<cmd>FzfLua lsp_code_actions<CR>", desc = "Code action" },
	},
	---@diagnostic enable: missing-fields
}
