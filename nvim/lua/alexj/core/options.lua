vim.cmd("let g:netrw_liststyle = 3")
vim.g.term = "xterm-kitty"

local opt = vim.opt

-- opt.colorcolumn = "80"
opt.wrap = true
opt.linebreak = true
opt.breakindent = true

-- line numbers
opt.relativenumber = true
opt.number = true
opt.cursorline = true

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "CursorLineNr", { link = "DiagnosticWarn" })
	end,
})

-- mouse
opt.mousemoveevent = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.softtabstop = 2
opt.autoindent = true

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- termguicolors
opt.background = "dark"
opt.signcolumn = "yes"
opt.termguicolors = true

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")
