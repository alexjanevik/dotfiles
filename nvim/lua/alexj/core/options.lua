vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.colorcolumn = "80"
opt.wrap = true

opt.relativenumber = true
opt.number = true
opt.mousemoveevent = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- search settings
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

-- termguicolors
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true
