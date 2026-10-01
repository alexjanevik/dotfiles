return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@module "snacks"
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		explorer = {
			enabled = true,
			replace_netrw = true,
			trash = true,
		},
		picker = {
			ui_select = false, -- Keep FzfLua as the vim.ui.select backend.
			hidden = true,
			ignored = true,
		},
		lazygit = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		notifier = { enabled = true },
		image = { enabled = true },
		scroll = { enabled = true },
	},
	init = function()
		-- Workaround: Force Snacks to re-render images on buffer switch
		vim.api.nvim_create_autocmd("BufWinEnter", {
			pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
			callback = function(args)
				vim.schedule(function()
					-- Ensure the buffer is still valid before applying the setting
					if vim.api.nvim_buf_is_valid(args.buf) then
						-- Unload the buffer when hidden. When you switch back,
						-- Neovim is forced to reload it, re-triggering the Snacks viewer.
						vim.bo[args.buf].bufhidden = "unload"
					end
				end)
			end,
		})
	end,
}
