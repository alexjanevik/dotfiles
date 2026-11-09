-- highlight cursor line number
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "CursorLineNr", { link = "DiagnosticWarn" })
	end,
})
