return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"davidmh/cspell.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			local cspell = require("cspell")

			local cspell_config = {
				config = {},
				filetypes = { "markdown", "text", "plaintext", "gitcommit" },
			}

			null_ls.setup({
				sources = {
					cspell.diagnostics.with(vim.tbl_extend("force", cspell_config, {
						extra_args = { "--locale", "en,en-GB" },
						diagnostics_postprocess = function(diagnostic)
							diagnostic.severity = vim.diagnostic.severity.HINT
						end,
					})),

					cspell.code_actions.with(cspell_config),
				},
			})
		end,
	},
}
