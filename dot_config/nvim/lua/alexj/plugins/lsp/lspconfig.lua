return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		local servers = require("alexj.lsp.servers")

		for server, config in pairs(servers) do
			vim.lsp.config(
				server,
				vim.tbl_deep_extend("force", {
					capabilities = capabilities,
				}, config)
			)
			vim.lsp.enable(server)
		end
	end,
}
