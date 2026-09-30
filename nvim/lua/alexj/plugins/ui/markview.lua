local themes = {
	["gruvbox-material"] = { bg0 = "#282828", bg1 = "#32302f" },
}

local current_theme = "gruvbox-material"

local bg0 = themes[current_theme].bg0
local bg1 = themes[current_theme].bg1

return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	dependencies = {
		"saghen/blink.cmp",
	},

	init = function()
		vim.g.markview_dark_bg = bg0
		vim.g.markview_alpha = 0.2
	end,

	config = function()
		local presets = require("markview.presets")

		require("markview").setup({
			markdown = {
				headings = presets.headings.glow,
				block_quotes = presets.block_quotes.obsidian,
				horizontal_rules = presets.horizontal_rules.thin,
				tables = presets.tables.rounded,
			},
		})

		local function adjust_backgrounds()
			if vim.g.colors_name ~= "gruvbox-material" then
				return
			end

			local bg_groups = {
				"MarkviewCode",
				"MarkviewInlineCode",
				"MarkviewIcon0",
				"MarkviewIcon1",
				"MarkviewIcon2",
				"MarkviewIcon3",
				"MarkviewIcon4",
				"MarkviewIcon5",
				"MarkviewIcon6",
				"MarkviewCodeInfo",
				"MarkviewCodeFg",
			}

			for _, group in ipairs(bg_groups) do
				local hl = vim.api.nvim_get_hl(0, {
					name = group,
					link = false,
					create = false,
				})

				if next(hl) ~= nil then
					if group == "MarkviewCodeFg" then
						hl.fg = bg1
					else
						hl.bg = bg1
					end
					vim.api.nvim_set_hl(0, group, hl)
				end
			end
		end

		local augroup = vim.api.nvim_create_augroup("MarkviewBackgroundOverrides", { clear = true })

		vim.api.nvim_create_autocmd("ColorScheme", {
			group = augroup,
			callback = function()
				vim.schedule(adjust_backgrounds)
			end,
		})

		vim.api.nvim_create_autocmd("VimEnter", {
			group = augroup,
			once = true,
			callback = function()
				vim.schedule(adjust_backgrounds)
			end,
		})

		vim.schedule(adjust_backgrounds)
	end,
}
