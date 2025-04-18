return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			automatic_installation = true,
			ensure_installed = {
				"html",
				"hls",
				"omnisharp",
				"ast_grep",
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
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"pylint", -- python linter
				"eslint_d", -- js linter
				"fourmolu", -- haskell formatter
			},
		})
	end,
}
