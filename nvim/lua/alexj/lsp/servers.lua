return {
	html = {},
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
	neocmake = {},
	rust_analyzer = {},
	sqlls = {},
	jdtls = {},
	jsonls = {},
	glsl_analyzer = {},
	ruff = {},

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
