return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@module "snacks"
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		-- dashboard = { enabled = true },
		explorer = {
			enabled = true,
			replace_netrw = true,
			trash = true,
		},
		picker = {
			hidden = true,
			ignored = true,
		},
		indent = { enabled = true },
		input = { enabled = true },
		notifier = { enabled = true },
		lazygit = { enabled = true },
		image = { enabled = true },
	},
	keys = {
		{
			"<leader>n",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notification History",
		},
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>ee",
			function()
				Snacks.explorer()
			end,
			desc = "Snacks Explorer",
		},
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
