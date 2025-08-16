return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = { icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" } },
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"html",
				"hls",
				"omnisharp",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"eslint",
				"emmet_ls",
				"prismals",
				"pyright",
				"clangd",
				"cmake",
				"rust_analyzer",
				"sqlls",
				"jdtls",
				"jsonls",
				"glsl_analyzer",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"pylint",
				"eslint_d",
				"fourmolu",
			},
		})
	end,
}
