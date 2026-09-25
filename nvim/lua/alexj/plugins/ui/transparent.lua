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
			},
		})
	end,
}
