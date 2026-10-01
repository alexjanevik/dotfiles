return {
	"neovim/nvim-lspconfig",
	dependencies = { "nvim-mini/mini.completion" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local capabilities = vim.tbl_deep_extend(
			"force",
			vim.lsp.protocol.make_client_capabilities(),
			require("mini.completion").get_lsp_capabilities()
		)

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
