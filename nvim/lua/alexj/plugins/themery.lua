return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			themes = { "gruvbox", "catppuccin", "tokyonight" },
			livePreview = true,
		})
		vim.keymap.set("n", "<leader>ft", "<cmd>Themery<cr>", { desc = "Change color scheme" })
	end,
}
