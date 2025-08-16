return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} }, -- better defaults for lua_ls in Neovim env
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		local function on_attach(client, bufnr)
			local map = function(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
			end

			-- Telescope-powered LSP nav
			map("n", "<leader>gR", "<cmd>Telescope lsp_references<CR>", "LSP: References")
			map("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", "LSP: Definitions")
			map("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", "LSP: Implementations")
			map("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<CR>", "LSP: Type Defs")

			-- Core LSP
			map("n", "<leader>gD", vim.lsp.buf.declaration, "LSP: Declaration")
			map("n", "<leader>ga", vim.lsp.buf.code_action, "LSP: Code Action")
			map("n", "<leader>gr", vim.lsp.buf.rename, "LSP: Rename")
			map("n", "gk", vim.lsp.buf.hover, "LSP: Hover")

			-- Diagnostics
			map("n", "<leader>gB", "<cmd>Telescope diagnostics bufnr=0<CR>", "LSP: Buffer Diagnostics")
			map("n", "<leader>gb", vim.diagnostic.open_float, "LSP: Line Diagnostics")
			map("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
			map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")

			-- QoL
			map("n", "<leader>gs", "<cmd>LspRestart<CR>", "LSP: Restart")

			-- Inlay hints (Nvim 0.10+)
			if vim.lsp.inlay_hint and client.server_capabilities.inlayHintProvider then
				vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
			end
		end

		-- helper to merge defaults
		local function with_defaults(cfg)
			return vim.tbl_deep_extend("force", { capabilities = capabilities, on_attach = on_attach }, cfg or {})
		end

		-- lua_ls (with neodev)
		vim.lsp.config(
			"lua_ls",
			with_defaults({
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						completion = { callSnippet = "Replace" },
						workspace = { checkThirdParty = false },
					},
				},
			})
		)

		-- svelte: notify on TS/JS changes
		vim.lsp.config(
			"svelte",
			with_defaults({
				on_attach = function(client, bufnr)
					on_attach(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePost", {
						pattern = { "*.js", "*.ts" },
						callback = function(ctx)
							client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
						end,
					})
				end,
			})
		)

		-- graphql: include Svelte/React filetypes
		vim.lsp.config(
			"graphql",
			with_defaults({
				filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
			})
		)

		-- rust_analyzer
		vim.lsp.config(
			"rust_analyzer",
			with_defaults({
				filetypes = { "rust" },
			})
		)

		-- emmet
		vim.lsp.config(
			"emmet_ls",
			with_defaults({
				filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
			})
		)

		-- pyright
		vim.lsp.config(
			"pyright",
			with_defaults({
				filetypes = { "python" },
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "basic",
							autoImportCompletions = true,
							useLibraryCodeForTypes = true,
						},
					},
				},
			})
		)

		-- glsl_analyzer
		vim.lsp.config(
			"glsl_analyzer",
			with_defaults({
				filetypes = { "glsl", "frag", "vert", "comp" },
			})
		)

		local ok_mlsp, mlsp = pcall(require, "mason-lspconfig")
		if ok_mlsp then
			for _, name in ipairs(mlsp.get_installed_servers()) do
				vim.lsp.config(name, with_defaults())
			end
		end
	end,
}
