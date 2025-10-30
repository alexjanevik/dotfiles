local M = {}

local function set(groups)
	local set_hl = vim.api.nvim_set_hl
	for name, opts in pairs(groups) do
		set_hl(0, name, opts)
	end
end

function M.apply()
	set({
		-- core/editor
		Normal = { bg = "none" },
		NormalNC = { bg = "none" },
		SignColumn = { bg = "none" },
		VertSplit = { bg = "none" },
		StatusLine = { bg = "none" },
		StatusLineNC = { bg = "none" },
		EndOfBuffer = { bg = "none" },

		-- floats / popups / messages
		NormalFloat = { bg = "none" },
		FloatBorder = { bg = "none" },
		Pmenu = { bg = "none" },
		-- keep selection visible; adjust if you want this transparent too:
		--PmenuSel = { bg = "none", ctermbg = 8 },
		MsgArea = { bg = "none" },
		MsgSeparator = { bg = "none" },
		ErrorMsg = { bg = "none" },
		WarningMsg = { bg = "none" },

		-- nvim-tree
		NvimTreeNormal = { bg = "none" },
		NvimTreeNormalNC = { bg = "none" },
		NvimTreeEndOfBuffer = { bg = "none" },
		NvimTreeVertSplit = { bg = "none" },

		-- winbar / barbecue
		WinBar = { bg = "none" },
		WinBarNC = { bg = "none" },
		BarbecueNormal = { bg = "none" },
		BarbecueContext = { bg = "none" },

		-- telescope
		TelescopeNormal = { bg = "none" },
		TelescopeBorder = { bg = "none" },
		TelescopePromptNormal = { bg = "none" },
		TelescopePromptBorder = { bg = "none" },
		TelescopePromptTitle = { bg = "none" },
		TelescopePreviewNormal = { bg = "none" },
		TelescopePreviewBorder = { bg = "none" },
		TelescopePreviewTitle = { bg = "none" },
		TelescopeResultsNormal = { bg = "none" },
		TelescopeResultsBorder = { bg = "none" },
		TelescopeResultsTitle = { bg = "none" },
	})
end

function M.setup()
	-- Apply on start and whenever a colorscheme is set
	vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
		group = vim.api.nvim_create_augroup("TransparentBG", { clear = true }),
		callback = function()
			M.apply()
		end,
	})

	-- Optional: a toggle command if you want to flip backgrounds back on
	vim.api.nvim_create_user_command("Transparent", function()
		M.apply()
	end, {})
end

return M
