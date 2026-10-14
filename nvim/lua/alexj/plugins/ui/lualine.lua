return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-mini/mini.icons",
		"AndreM222/copilot-lualine",
	},
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")
		local wide = function()
			return vim.fn.winwidth(0) > 80
		end

		-- Read Mason's local registry; rendering the statusline never refreshes it.
		local mason_count, mason_checked = 0, 0
		local function mason_updates()
			if os.time() - mason_checked >= 60 then
				mason_checked = os.time()
				mason_count = 0
				local ok, registry = pcall(require, "mason-registry")
				if ok then
					for _, package in ipairs(registry.get_installed_packages()) do
						local success, outdated = pcall(function()
							local installed = package:get_installed_version()
							return installed ~= nil and installed ~= package:get_latest_version()
						end)
						if success and outdated then
							mason_count = mason_count + 1
						end
					end
				end
			end
			return mason_count > 0 and (mason_count .. " ") or ""
		end

		lualine.setup({
			options = {
				theme = "auto",
				component_separators = "",
				section_separators = "",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", { "diff", cond = wide } },
				lualine_c = {
					"filename",
					"diagnostics",
					function()
						local register = vim.fn.reg_recording()
						return register ~= "" and ("󰑋 " .. register) or ""
					end,
				},
				lualine_x = {
					{ "lsp_status", ignore_lsp = { "copilot" }, cond = wide },
					{ "copilot", show_colors = false },
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						on_click = function()
							vim.cmd("Lazy")
						end,
					},
					{
						mason_updates,
						on_click = function()
							vim.cmd("Mason")
						end,
					},
					{ "fileformat", fmt = string.upper, cond = wide },
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
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
