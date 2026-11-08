return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		-- import comment plugin safely
		local comment = require("Comment")

		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		-- enable comment
		comment.setup({
			-- for commenting tsx, jsx, svelte, html files
			--pre_hook = ts_context_commentstring.create_pre_hook(),
			pre_hook = function(ctx)
				-- Run the default context hook first
				local hook = ts_context_commentstring.create_pre_hook()
				local result = hook(ctx)

				-- Fallback manually if the result is nil for C/C++ files
				if not result and (vim.bo.filetype == "cpp" or vim.bo.filetype == "c") then
					return "// %s"
				end

				return result
			end,
		})
	end,
}
