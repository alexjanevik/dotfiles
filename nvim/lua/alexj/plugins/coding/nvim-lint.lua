return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			markdown = { "markdownlint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		-- disable MD013 (line length) for markdownlint
		local markdownlint = lint.linters.markdownlint
		markdownlint.args = vim.list_extend(markdownlint.args or {}, {
			"--disable",
			"MD013",
		})
	end,
}
