return {
	{
		"willothy/nvim-cokeline",
		dependencies = {
			"nvim-mini/mini.icons",
		},
		config = function()
			local get_hex = require("cokeline.hlgroups").get_hl_attr

			local opts = {
				default_hl = {
					fg = function(buffer)
						return buffer.is_focused and get_hex("Normal", "fg") or get_hex("Comment", "fg")
					end,
					bg = "NONE",
				},
				components = {
					{
						-- left separator
						text = function(buffer)
							return (buffer.index ~= 1) and "▏" or ""
						end,
						fg = function()
							return get_hex("Comment", "fg")
						end,
					},
					-- buffer index
					{
						text = function(buffer)
							return " " .. "[" .. buffer.index .. "]  "
						end,
						fg = function(buffer)
							return buffer.is_focused and get_hex("Normal", "fg") or get_hex("Comment", "fg")
						end,
						bold = function(buffer)
							return buffer.is_focused
						end,
					},
					-- devicon
					{
						text = function(buffer)
							return buffer.devicon.icon
						end,
						fg = function(buffer)
							return buffer.devicon.color
						end,
					},
					-- filename
					{
						text = function(buffer)
							return buffer.filename
						end,
						bold = function(buffer)
							return buffer.is_focused
						end,
					},
					{
						text = "  ",
					},
					-- close button/modified indicator
					{
						text = function(buffer)
							return buffer.is_hovered and " " or (buffer.is_modified and " " or " ")
						end,
						on_click = function(_, _, _, _, buffer)
							buffer:delete()
						end,
						-- highlight on hover
						fg = function(buffer)
							return buffer.is_hovered and get_hex("DiagnosticError", "fg")
								or (
									buffer.is_modified and get_hex("green", "fg")
									or (buffer.is_focused and get_hex("Normal", "fg") or get_hex("Comment", "fg"))
								)
						end,
					},
					{
						text = "  ",
					},
				},
			}

			-- Each severity needs its own component to use a separate colour.
			for i, diagnostic in ipairs({
				{ key = "errors", icon = "", hl = "DiagnosticError" },
				{ key = "warnings", icon = "", hl = "DiagnosticWarn" },
				{ key = "infos", icon = "", hl = "DiagnosticInfo" },
				{ key = "hints", icon = "", hl = "DiagnosticHint" },
			}) do
				table.insert(opts.components, 4 + i, {
					text = function(buffer)
						local count = buffer.diagnostics[diagnostic.key]
						return count > 0 and (" " .. diagnostic.icon .. " " .. count) or ""
					end,
					fg = function()
						return get_hex(diagnostic.hl, "fg")
					end,
				})
			end

			require("cokeline").setup(opts)
		end,
	},
}
