return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		local on_attach = function(_, bufnr)
			local map = function(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
			end

			--[[
      map("n", "<leader>gd", vim.lsp.buf.definition, "Go to definition")
			map("n", "<leader>gr", vim.lsp.buf.references, "References")
			map("n", "<leader>gi", vim.lsp.buf.implementation, "Implementations")
			map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
      ]]
			--

			map("n", "<leader>r", vim.lsp.buf.rename, "Rename")
			map("n", "<leader>f", function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end, "Format")
		end

		local servers = require("alexj.lsp.servers")

		for server, config in pairs(servers) do
			vim.lsp.config(
				server,
				vim.tbl_deep_extend("force", {
					capabilities = capabilities,
					on_attach = on_attach,
				}, config)
			)
			vim.lsp.enable(server)
		end
	end,
}
