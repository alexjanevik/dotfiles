return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-mini/mini.icons",
		"AndreM222/copilot-lualine",
	},
	config = function()
		local lualine = require("lualine")
		local wide85 = function()
			return vim.fn.winwidth(0) > 90
		end
		local wide70 = function()
			return vim.fn.winwidth(0) > 70
		end

		local colourme = require("colourme")

		-- Lualine's "auto" theme paints sections black when StatusLine/Normal have no background
		-- (they're cleared for transparency), so build the theme from the colourme palette instead.
		local function colourme_theme()
			local bg, fg = colourme.color("bg"), colourme.color("fg")
			local raised, muted = colourme.color("bg3"), colourme.color("comment")
			local function mode(accent)
				return {
					a = { fg = bg, bg = accent, gui = "bold" },
					b = { fg = fg, bg = raised },
					c = { fg = fg, bg = "NONE" },
					y = { fg = fg, bg = raised },
					z = { fg = bg, bg = colourme.color(5) },
				}
			end
			return {
				normal = mode(colourme.color(12)),
				insert = mode(colourme.color(2)),
				visual = mode(colourme.color(1)),
				replace = mode(colourme.color(3)),
				command = mode(colourme.color(1)),
				terminal = mode(colourme.color(6)),
				inactive = {
					a = { fg = muted, bg = raised },
					b = { fg = muted, bg = "NONE" },
					c = { fg = muted, bg = "NONE" },
				},
			}
		end

		lualine.setup({
			options = {
				theme = colourme_theme(),
				component_separators = "",
				section_separators = { left = "▓▒░", right = "░▒▓" },
			},
			sections = {
				lualine_a = { { "mode", separator = { left = "░▒▓", right = "▓▒░" } } },
				lualine_b = { { "branch", icon = "" } },
				lualine_c = {
					"filename",
					function()
						local register = vim.fn.reg_recording()
						return register ~= "" and (" " .. register) or ""
					end,
				},
				lualine_x = {
					{
						"lsp_status",
						ignore_lsp = { "copilot", "null-ls" },
						cond = wide70,
						icon = " ",
						symbols = { done = "", spinner = { "" } },
						color = colourme.pair(2, "bg"),
						separator = { left = "░▒▓" },
					},
					{
						"copilot",
						color = colourme.pair(2, "bg"),
						separator = { left = "░▒▓" },
					},
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = {
							error = " ",
							warn = " ",
							info = "󰌵 ",
							hint = " ",
						},
						colored = false,
						color = colourme.pair(1, "bg"),
						separator = { left = "░▒▓" }, -- LSP dithers into diagnostics
					},
				},
				lualine_y = { { "filetype", colored = false, cond = wide85 } },
				lualine_z = { "location", { "progress", separator = { right = "▓▒░" } } },
			},
		})

		vim.api.nvim_create_autocmd("ColorScheme", {
			group = vim.api.nvim_create_augroup("LualineColourmeTheme", { clear = true }),
			callback = function()
				local config = lualine.get_config()
				config.options.theme = colourme_theme()
				lualine.setup(config)
			end,
		})

		vim.api.nvim_create_autocmd({ "RecordingEnter", "RecordingLeave" }, {
			group = vim.api.nvim_create_augroup("LualineRecording", { clear = true }),
			callback = function()
				-- RecordingLeave fires before reg_recording() is cleared.
				vim.defer_fn(function()
					lualine.refresh({ place = { "statusline" } })
				end, 50)
			end,
		})
	end,
}
