return {
	"nvim-mini/mini.icons",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function(_, opts)
		local icons = require("mini.icons")
		icons.setup(opts)
		-- Keep plugins using the nvim-web-devicons API compatible.
		icons.mock_nvim_web_devicons()
	end,
}
