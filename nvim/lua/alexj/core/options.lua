vim.cmd("let g:netrw_liststyle = 3")
vim.g.term = "xterm-kitty"

local opt = vim.opt

-- opt.colorcolumn = "80"
opt.wrap = true

opt.relativenumber = true
opt.number = true
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

opt.cursorline = true

-- termguicolors
opt.background = "dark"
opt.signcolumn = "yes"

vim.cmd([[
  autocmd VimEnter * highlight Normal ctermbg=NONE guibg=NONE
  autocmd VimEnter * highlight NonText ctermbg=NONE
]])

opt.termguicolors = true

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- neovim python vevn
vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python3")
