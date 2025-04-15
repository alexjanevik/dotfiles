--- @type LazyPluginSpec
return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"AndreM222/copilot-lualine",
		"pnx/lualine-lsp-status",
	},
	config = function()
		local lualine = require("lualine")
		local colors = {
			bg = "#1e1e2e",
			fg = "#cdd6f4",
			yellow = "#f9e2af",
			cyan = "#89dceb",
			darkblue = "#89b4fa",
			green = "#a6e3a1",
			orange = "#fab387",
			violet = "#f5c2e7",
			magenta = "#cba6f7",
			blue = "#74c7ec",
			red = "#f38ba8",
		}

		local conditions = {
			hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end,
		}

		local mode_color = {
			n = colors.red,
			i = colors.green,
			v = colors.blue,
			[""] = colors.blue,
			V = colors.blue,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			[""] = colors.orange,
			ic = colors.yellow,
			R = colors.violet,
			Rv = colors.violet,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			["!"] = colors.red,
			t = colors.red,
		}

		local theme = {
			normal = {
				a = { bg = "None", gui = "bold" },
				b = { bg = "None", gui = "bold" },
				c = { bg = "None", gui = "bold" },
				x = { bg = "None", gui = "bold" },
				y = { bg = "None", gui = "bold" },
				z = { bg = "None", gui = "bold" },
			},
			insert = {
				a = { bg = "None", gui = "bold" },
				b = { bg = "None", gui = "bold" },
				c = { bg = "None", gui = "bold" },
				x = { bg = "None", gui = "bold" },
				y = { bg = "None", gui = "bold" },
				z = { bg = "None", gui = "bold" },
			},
			visual = {
				a = { bg = "None", gui = "bold" },
				b = { bg = "None", gui = "bold" },
				c = { bg = "None", gui = "bold" },
				x = { bg = "None", gui = "bold" },
				y = { bg = "None", gui = "bold" },
				z = { bg = "None", gui = "bold" },
			},
			replace = {
				a = { bg = "None", gui = "bold" },
				b = { bg = "None", gui = "bold" },
				c = { bg = "None", gui = "bold" },
				x = { bg = "None", gui = "bold" },
				y = { bg = "None", gui = "bold" },
				z = { bg = "None", gui = "bold" },
			},
			command = {
				a = { bg = "None", gui = "bold" },
				b = { bg = "None", gui = "bold" },
				c = { bg = "None", gui = "bold" },
				x = { bg = "None", gui = "bold" },
				y = { bg = "None", gui = "bold" },
				z = { bg = "None", gui = "bold" },
			},
			inactive = {
				a = { bg = "None", gui = "bold" },
				b = { bg = "None", gui = "bold" },
				c = { bg = "None", gui = "bold" },
				x = { bg = "None", gui = "bold" },
				y = { bg = "None", gui = "bold" },
				z = { bg = "None", gui = "bold" },
			},
		}

		local function mason_updates()
			local registry = require("mason-registry")
			registry.refresh()
			local installed_packages = registry.get_installed_package_names()
			local upgrades_available = false
			local packages_outdated = 0
			local function myCallback(success, _)
				if success then
					upgrades_available = true
					packages_outdated = packages_outdated + 1
				end
			end

			for _, pkg in pairs(installed_packages) do
				local p = registry.get_package(pkg)
				if p then
					p:check_new_version(myCallback)
				end
			end

			if upgrades_available then
				return packages_outdated
			else
				return 0
			end
		end

		local function show_macro_recording()
			local recording_register = vim.fn.reg_recording()
			if recording_register == "" then
				return ""
			else
				return "󰑋  " .. recording_register
			end
		end

		local mode = {
			"mode",
			separator = { left = "", right = "" },
			right_padding = 2,
			color = function()
				return { bg = mode_color[vim.fn.mode()], fg = colors.bg }
			end,
		}
		local filename = {
			"filename",
			color = { fg = colors.magenta, bg = "None", gui = "bold" },
		}
		local branch = {
			"branch",
			icon = "",
			color = { fg = colors.violet, bg = "None", gui = "bold" },
			on_click = function()
				vim.cmd("Neogit")
			end,
		}
		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", info = " " },
			diagnostics_color = {
				color_error = { fg = colors.red, bg = "None", gui = "bold" },
				color_warn = { fg = colors.yellow, bg = "None", gui = "bold" },
				color_info = { fg = colors.cyan, bg = "None", gui = "bold" },
			},
			color = { bg = mode, gui = "bold" },
		}
		local macro_recording = {
			show_macro_recording,
			color = { fg = "#333333", bg = "#ff6666" },
			separator = { left = "", right = "" },
		}
		local copilot = {
			"copilot",
			symbols = {
				status = {
					hl = {
						enabled = colors.green,
						sleep = colors.yellow,
						disabled = colors.bg,
						warning = colors.orange,
						unknown = colors.red,
					},
				},
			},
			show_colors = true,
			color = { bg = "None", gui = "bold" },
		}
		local diff = {
			"diff",
			symbols = { added = " ", modified = "󰝤 ", removed = " " },
			diff_color = {
				added = { fg = colors.green, bg = "None" },
				modified = { fg = colors.orange, bg = "None" },
				removed = { fg = colors.red, bg = "None" },
			},
			cond = conditions.hide_in_width,
		}
		local fileformat = {
			"fileformat",
			fmt = string.upper,
			color = { fg = colors.green, bg = "None", gui = "bold" },
		}
		local lazy = {
			require("lazy.status").updates,
			cond = require("lazy.status").has_updates,
			color = { fg = colors.violet, bg = "None" },
			on_click = function()
				vim.ui.select({ "Yes", "No" }, { prompt = "Update plugins?" }, function(choice)
					if choice == "Yes" then
						vim.cmd("Lazy sync")
					else
						vim.notify("Update cancelled", vim.log.levels.INFO, { title = "Lazy" })
					end
				end)
			end,
		}
		local mason = {
			mason_updates() .. "",
			color = { fg = colors.violet, bg = "None" },
			cond = function()
				return mason_updates() > 0
			end,
			icon = "",
			on_click = function()
				vim.cmd("Mason")
			end,
		}
		local buffers = {
			function()
				local bufs = vim.api.nvim_list_bufs()
				local bufNumb = 0
				local function buffer_is_valid(buf_id, buf_name)
					return 1 == vim.fn.buflisted(buf_id) and buf_name ~= ""
				end
				for idx = 1, #bufs do
					local buf_id = bufs[idx]
					local buf_name = vim.api.nvim_buf_get_name(buf_id)
					if buffer_is_valid(buf_id, buf_name) then
						bufNumb = bufNumb + 1
					end
				end

				if bufNumb == 1 then
					return bufNumb .. " "
				else
					return bufNumb .. " "
				end
			end,
			color = { fg = colors.darkblue, bg = "None" },
			on_click = function()
				require("buffer_manager.ui").toggle_quick_menu()
			end,
		}
		local filetype = {
			"filetype",
			color = { fg = colors.darkblue, bg = "None" },
		}
		local progress = {
			"progress",
			color = { fg = colors.magenta, bg = "None" },
		}
		local location = {
			"location",
			separator = { left = "", right = "" },
			left_padding = 2,
			color = function()
				return { bg = mode_color[vim.fn.mode()], fg = colors.bg }
			end,
		}
		local sep = {
			"%=",
			color = { fg = colors.bg, bg = "None" },
		}

		lualine.setup({
			options = {
				theme = theme,
				component_separators = "",
				section_separators = { left = "", right = "" },
				always_divide_middle = false,
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { filename, branch, "lsp-status" },
				-- lualine_b = { branch, "lsp-status" },
				lualine_c = { diagnostics, sep, macro_recording },
				-- lualine_c = { sep, harpoon },
				lualine_x = { copilot, diff, fileformat, lazy, mason },
				-- lualine_x = { copilot, fileformat, lazy, mason },
				lualine_y = { buffers, filetype, progress },
				lualine_z = { location },
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = {},
		})

		vim.api.nvim_create_autocmd("RecordingEnter", {
			callback = function()
				lualine.refresh()
			end,
		})

		vim.api.nvim_create_autocmd("RecordingLeave", {
			callback = function()
				local timer = vim.loop.new_timer()
				timer:start(
					50,
					0,
					vim.schedule_wrap(function()
						lualine.refresh()
					end)
				)
			end,
		})
	end,
}
