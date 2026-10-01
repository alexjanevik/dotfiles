return {
	{
		"mason-org/mason.nvim",
		opts = { ui = { border = "rounded" } },
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
		opts = function()
			return {
				ensure_installed = vim.tbl_keys(require("alexj.lsp.servers")),
				-- lspconfig.lua enables our configured servers explicitly.
				automatic_enable = false,
			}
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				"prettier",
				"stylua",
				"clang-format",
				"markdownlint",
			},
			auto_update = false,
			run_on_start = true,
			start_delay = 3000,
			debounce_hours = 24,
		},
	},
}
