return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},

	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
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
			automatic_enable = false,
		},
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
		},
		opts = {
			ensure_installed = {
				-- LSP servers
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

				-- formatters / linters / external tools
				"prettier",
				"stylua",
				"pylint",
				"eslint_d",
				"fourmolu",
			},
			auto_update = false,
			run_on_start = true,
			start_delay = 3000,
			debounce_hours = 24,
		},
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()

			local on_attach = function(_, bufnr)
				local map = function(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
				end

				map("n", "gd", vim.lsp.buf.definition, "Go to definition")
				map("n", "gr", vim.lsp.buf.references, "References")
				map("n", "gi", vim.lsp.buf.implementation, "Implementations")
				map("n", "K", vim.lsp.buf.hover, "Hover")
				map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
				map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
				map("n", "<leader>f", function()
					vim.lsp.buf.format({ async = true })
				end, "Format")
			end

			local servers = {
				html = {},
				hls = {},
				omnisharp = {},
				cssls = {},
				tailwindcss = {},
				svelte = {},
				graphql = {},
				eslint = {},
				emmet_ls = {},
				prismals = {},
				pyright = {},
				clangd = {},
				cmake = {},
				rust_analyzer = {},
				sqlls = {},
				jdtls = {},
				jsonls = {},
				glsl_analyzer = {},

				lua_ls = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								checkThirdParty = false,
								library = {
									vim.env.VIMRUNTIME,
								},
							},
							telemetry = {
								enable = false,
							},
						},
					},
				},
			}

			for server, config in pairs(servers) do
				config.capabilities = capabilities
				config.on_attach = on_attach
				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end
		end,
	},
}
