return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-mini/mini.icons",
		"AndreM222/copilot-lualine",
	},
	config = function()
		local lualine = require("lualine")
		local wide = function()
			return vim.fn.winwidth(0) > 80
		end

		local colourme = require("alexj.colourme")

		-- The centred box holds LSP names and diagnostics. Its end caps always render (an empty
		-- component loses its separator), so show the whole box only when it has content.
		local ignored_lsp = { copilot = true, ["null-ls"] = true }
		local function box_visible()
			if #vim.diagnostic.get(0) > 0 then
				return true
			end
			if not wide() then
				return false
			end
			for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
				if not ignored_lsp[client.name] then
					return true
				end
			end
			return false
		end
		local function end_cap(separator)
			return {
				function()
					return " "
				end,
				padding = 0,
				cond = box_visible,
				color = colourme.pair(12, "bg"),
				separator = separator,
			}
		end

		lualine.setup({
			options = {
				theme = "auto",
				component_separators = "",
				section_separators = { left = "▓▒░", right = "░▒▓" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { { "branch", icon = "" } },
				lualine_c = {
					"filename",
					function()
						local register = vim.fn.reg_recording()
						return register ~= "" and ("󰑋 " .. register) or ""
					end,
					-- spacer
					{
						function()
							return "%="
						end,
						padding = 0,
					},
					end_cap({ left = "░▒▓" }),
					{
						"lsp_status",
						ignore_lsp = { "copilot", "null-ls" },
						cond = wide,
						icon = " ",
						color = colourme.pair(12, "bg"),
					},
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = {
							error = " ", -- Replace with your preferred Nerd Font icon
							warn = " ", -- Replace with your preferred Nerd Font icon
							info = "󰌵 ", -- Replace with your preferred Nerd Font icon
						},
						colored = false,
						color = colourme.pair(12, "bg"),
					},
					end_cap({ right = "▓▒░" }),
				},
				lualine_x = {},
				lualine_y = { { "filetype", colored = false } },
				lualine_z = { "location", "progress" },
			},
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
