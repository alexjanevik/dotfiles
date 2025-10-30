return {
	"rjshkhr/shadow.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.opt.termguicolors = true
		vim.opt.background = "dark"
		--vim.cmd([[colorscheme shadow]])
		require("alexj.transparent").setup()
		vim.cmd([[highlight PmenuSel guibg=#a3be8c]])
	end,
}
