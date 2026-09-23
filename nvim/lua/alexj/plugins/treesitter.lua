local parsers = {
	"bash",
	"c",
	"cpp",
	"css",
	"dockerfile",
	"gitignore",
	"glsl",
	"graphql",
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
	"latex",
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
