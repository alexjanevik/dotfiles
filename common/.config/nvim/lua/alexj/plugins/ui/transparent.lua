return {
	"xiyaowong/transparent.nvim",
	priority = 900,
	enabled = true,
	config = function()
		require("transparent").setup({
			enable = true,
			--groups = {},
			extra_groups = {
				"NormalFloat",
				"FloatBorder",
				"FloatTitle",
				"FloatFooter",
				"WinSeparator",
				-- gutter / folds
				"Folded",
				"LineNrAbove",
				"LineNrBelow",
				"CursorLineFold",
				"CursorLineSign",
				-- tabline / winbar
				"TabLine",
				"TabLineFill",
				"TabLineSel",
				"WinBar",
				"WinBarNC",
				-- misc
				"QuickFixLine",
				"MsgSeparator",
				"WhichKeyFloat",
				"WhichKeySeparator",
			},
			exclude_groups = {
				--"CursorLine",
			},
		})
	end,
}
