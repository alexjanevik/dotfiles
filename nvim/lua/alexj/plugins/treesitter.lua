local parsers = {
	"bash",
	"c",
	"css",
	"dockerfile",
	"gitignore",
	"glsl",
	"graphql",
	"haskell",
	"html",
	"java",
	"javascript",
	"json",
	"lua",
	"markdown",
	"markdown_inline",
	"prisma",
	"python",
	"query",
	"rust",
	"svelte",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"yaml",
}

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",

	dependencies = {
		{
			"windwp/nvim-ts-autotag",
			opts = {},
		},
	},

	config = function()
		vim.filetype.add({
			extension = {
				frag = "glsl",
				vert = "glsl",
			},
		})

		local treesitter = require("nvim-treesitter")

		treesitter.setup({})
		treesitter.install(parsers)
	end,
}
