return {
	"windwp/nvim-autopairs",
	event = { "InsertEnter" },
	config = function()
		-- import nvim-autopairs
		local autopairs = require("nvim-autopairs")

		-- configure autopairs
		autopairs.setup({
			map_cr = false,
			check_ts = true, -- enable treesitter
			ts_config = {
				lua = { "string" }, -- don't add pairs in lua string treesitter nodes
				javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
				java = false, -- don't check treesitter on java
			},
		})

		vim.keymap.set("i", "<CR>", function()
			if vim.fn.pumvisible() == 1 and vim.fn.complete_info({ "selected" }).selected ~= -1 then
				return autopairs.esc("<C-y>")
			end
			local cancel = vim.fn.pumvisible() == 1 and autopairs.esc("<C-e>") or ""
			return cancel .. autopairs.autopairs_cr()
		end, { expr = true, replace_keycodes = false, desc = "Accept completion or insert paired newline" })
	end,
}
