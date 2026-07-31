vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>h", ":nohl<CR>", { desc = "Clear search highlights" })
-- copilot
vim.g.copilot_no_tab_map = true
-- my wezterm keybind for CMD + Enter is <Char-0xAA>
keymap.set("i", "<Char-0xAA>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})
