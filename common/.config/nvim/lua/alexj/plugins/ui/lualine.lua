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

		local function markdown_wordcount()
			-- Only track stats for markdown or text files
			if vim.bo.filetype ~= "markdown" and vim.bo.filetype ~= "text" then
				return ""
			end

			local wc = vim.fn.wordcount()

			-- check if we are in one of the visual modes
			local mode = vim.fn.mode()
			if mode == "v" or mode == "V" or mode == "\22" then -- \22 represents Ctrl+V
				local selected_words = wc.visual_words

				-- When you first press visual mode, visual_words might briefly be nil
				if selected_words and selected_words > 0 then
					return tostring(" " .. selected_words)
				end
			end

			-- total document word count in normal mode
			return tostring(" " .. wc.words)
		end

		require("lualine").setup({
			sections = {
				-- Assign the custom component to your section of choice
				lualine_y = { markdown_wordcount },
			},
		})

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

					--{ "fileformat", fmt = string.upper, cond = wide },
					--{},
					"filetype",
				},
				lualine_y = { markdown_wordcount, "progress" },
				lualine_z = { "location" },
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
