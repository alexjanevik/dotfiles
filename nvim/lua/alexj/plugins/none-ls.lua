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
				config = {
					cspell_config_dirs = { vim.fn.expand("~/.config/cspell") },
				},
				filetypes = { "markdown", "text", "plaintext", "gitcommit" },
			}

			null_ls.setup({
				sources = {
					cspell.diagnostics.with(vim.tbl_extend("force", cspell_config, {
						extra_args = function()
							-- let global config take precedence over language
							local path = vim.fn.expand("~/.config/cspell/cspell.json")
							local config = vim.json.decode(table.concat(vim.fn.readfile(path), "\n"))
							return config.language and { "--locale", config.language } or {}
						end,
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
