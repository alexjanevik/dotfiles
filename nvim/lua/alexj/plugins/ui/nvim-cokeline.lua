return {
	{
		"willothy/nvim-cokeline",
		dependencies = {
			"nvim-mini/mini.icons",
		},
		config = function()
			local get_hex = require("cokeline.hlgroups").get_hl_attr

			local map = vim.api.nvim_set_keymap

			map("n", "<leader>tl", "<Plug>(cokeline-focus-prev)", { silent = true, desc = "Focus previous buffer" })
			map("n", "<leader>th", "<Plug>(cokeline-focus-next)", { silent = true, desc = "Focus next buffer" })
			map("n", "<leader>tw", "<Plug>(cokeline-pick-close)", { silent = true, desc = "Close current buffer" })

			for i = 1, 9 do
				map("n", ("<leader>ts%s"):format(i), ("<Plug>(cokeline-focus-%s)"):format(i), { silent = true })
			end

			require("cokeline").setup({
				default_hl = {
					fg = function(buffer)
						return buffer.is_focused and get_hex("Normal", "fg") or get_hex("Comment", "fg")
					end,
					bg = "NONE",
				},
				components = {
					{
						text = function(buffer)
							return (buffer.index ~= 1) and "▏" or ""
						end,
						fg = function()
							return get_hex("Normal", "fg")
						end,
					},
					{
						text = function(buffer)
							return "    " .. buffer.devicon.icon
						end,
						fg = function(buffer)
							return buffer.devicon.color
						end,
					},
					{
						text = function(buffer)
							return buffer.filename .. "    "
						end,
						bold = function(buffer)
							return buffer.is_focused
						end,
					},
					{
						--text = "",
						text = function(buffer)
							return buffer.is_hovered and "" or ""
						end,
						on_click = function(_, _, _, _, buffer)
							buffer:delete()
						end,
						-- highlight on hover
						fg = function(buffer)
							return buffer.is_hovered and get_hex("DiagnosticError", "fg") or get_hex("Normal", "fg")
						end,
					},
					{
						text = "  ",
					},
				},
			})
		end,
	},
}
