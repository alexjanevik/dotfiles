return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					--custom Cmd+Enter
					accept = "<Char-0xAA>",
				},
			},
			panel = { enabled = false },
		},
		config = function(_, opts)
			require("copilot").setup(opts)
			local group = vim.api.nvim_create_augroup("CopilotBlinkSuggestions", { clear = true })
			vim.api.nvim_create_autocmd("User", {
				group = group,
				pattern = "BlinkCmpMenuOpen",
				callback = function()
					vim.b.copilot_suggestion_hidden = true
				end,
			})
			vim.api.nvim_create_autocmd("User", {
				group = group,
				pattern = "BlinkCmpMenuClose",
				callback = function()
					vim.b.copilot_suggestion_hidden = false
				end,
			})
		end,
	},
}
