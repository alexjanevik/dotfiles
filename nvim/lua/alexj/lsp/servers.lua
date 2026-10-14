return {
	html = {},
	omnisharp = {},
	cssls = {},
	tailwindcss = {
		filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
	},
	svelte = {},
	graphql = {},
	eslint = {},
	emmet_ls = {},
	prismals = {},
	pyright = {},
	clangd = {
		filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
	},
	neocmake = {},
	rust_analyzer = {},
	sqlls = {},
	jdtls = {},
	jsonls = {},
	glsl_analyzer = {
		filetypes = { "glsl" },
	},
	ruff = {},
	rumdl = {
		settings = {
			disable = { "MD013" },
		},
	},

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
