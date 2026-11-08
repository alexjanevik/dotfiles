local gruvbox_material_theme = require("yatline-gruvbox-material"):setup({ mode = "dark", toughness = "medium" })

local ok, yatline = pcall(require, "yatline")
if ok then
	yatline:setup({
		theme = gruvbox_material_theme,
	})
end
