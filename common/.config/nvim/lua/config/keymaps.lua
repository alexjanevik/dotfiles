-- Mappings only. Group names and icons live in plugins/editor/which-key.lua, which picks up each `desc`.

local function map(lhs, rhs, desc, opts)
	vim.keymap.set("n", lhs, rhs, vim.tbl_extend("force", { desc = desc, silent = true }, opts or {}))
end

-- Snacks is lazy-loaded, so resolve it when the key is pressed, not at startup.
-- snacks("picker.files") calls Snacks.picker.files().
local function snacks(path)
	return function()
		local target = require("snacks")
		for part in path:gmatch("[^.]+") do
			target = target[part]
		end
		target()
	end
end

-- ## Buffers
map("<leader>bh", "<Plug>(cokeline-focus-prev)", "Focus previous buffer", { remap = true })
map("<leader>bl", "<Plug>(cokeline-focus-next)", "Focus next buffer", { remap = true })
map("<leader>bw", snacks("bufdelete.delete"), "Close current buffer")
for i = 1, 9 do
	map("<leader>b" .. i, "<Plug>(cokeline-focus-" .. i .. ")", "Focus buffer " .. i, { remap = true })
end

-- ## Find
map("<leader>ff", snacks("picker.files"), "Files")
map("<leader>fg", snacks("picker.grep"), "Grep")
map("<leader>fp", snacks("picker.pickers"), "Pickers")
map("<leader>fb", snacks("picker.buffers"), "Buffers")
map("<leader>fr", snacks("picker.recent"), "Recent")
map("<leader>fs", snacks("picker.smart"), "Smart")

-- ## Snacks
map("<leader>e", snacks("explorer"), "Explorer")
map("<leader>n", snacks("picker.notifications"), "Notifications")

-- ## LSP
map("<leader>gd", snacks("picker.lsp_definitions"), "Go to definition")
map("<leader>gr", snacks("picker.lsp_references"), "References")
map("<leader>gi", snacks("picker.lsp_implementations"), "Implementations")
map("<leader>gn", function()
	vim.lsp.buf.rename()
end, "Rename symbol")
map("<leader>ga", function()
	vim.lsp.buf.code_action()
end, "Code action")
map("<leader>gss", snacks("picker.lsp_symbols"), "Document symbols")
map("<leader>gsw", snacks("picker.lsp_workspace_symbols"), "Workspace symbols")

-- ## Diagnostics
map("<leader>xw", snacks("picker.diagnostics"), "Diagnostics (Workspace)")
map("<leader>xx", snacks("picker.diagnostics_buffer"), "Diagnostics (Document)")

-- ## Git
map("<leader>lg", snacks("lazygit"), "Lazygit")
map("<leader>lb", snacks("picker.git_branches"), "Git branches")
map("<leader>ls", snacks("picker.git_status"), "Git status")
map("<leader>lx", snacks("picker.git_stash"), "Git stash")
map("<leader>ld", snacks("picker.git_diff"), "Git diff")
map("<leader>ll", snacks("picker.git_log"), "Git log")
