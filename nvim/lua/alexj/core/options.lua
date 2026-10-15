-- # options.lua

-- ## LEADER KEY
vim.g.mapleader = " "

local opt = vim.opt

-- ## Options

vim.cmd("set noswapfile")

-- ### wrapping
opt.wrap = true
opt.linebreak = true
opt.breakindent = true

-- ### line numbers
opt.relativenumber = true
opt.number = true
opt.cursorline = true
-- highlight cursor line number
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "CursorLineNr", { link = "DiagnosticWarn" })
	end,
})

-- ### mouse
vim.opt.mouse = "a"
opt.mousemoveevent = true
opt.mousemodel = "popup"
vim.cmd("aunmenu PopUp.How-to\\ disable\\ mouse")
vim.cmd("aunmenu PopUp.-2-")

-- ### folds
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevelstart = 99

-- ### tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.softtabstop = 2
opt.autoindent = true

-- ### search settings
opt.ignorecase = true
opt.smartcase = true

-- ### termguicolors
opt.background = "dark"
opt.signcolumn = "yes"
opt.termguicolors = true

-- ### backspace
opt.backspace = "indent,eol,start"

-- ### clipboard
opt.clipboard:append("unnamedplus")
