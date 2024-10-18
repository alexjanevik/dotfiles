local wezterm = require("wezterm")
local table = require("table")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

---- Font and theme
config.font = wezterm.font("MesloLGS Nerd Font Mono")
--config.font = wezterm.font("Fira Code")
--config.font = wezterm.font("MonoLisa")
config.font_size = 14

config.color_scheme = "Catppuccin Mocha"

-- Window settings
config.initial_cols = 108
config.initial_rows = 32

config.window_padding = {
	left = "0cell",
	right = "0cell",
	top = "0cell",
	bottom = "0cell",
}

config.enable_scroll_bar = false
config.use_fancy_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.scrollback_lines = 1000
config.default_cursor_style = "BlinkingBar"
config.window_decorations = "RESIZE"

config.scrollback_lines = 50000

--config.window_background_opacity = 0.9
--config.macos_window_background_blur = 50

config.native_macos_fullscreen_mode = true

-- Hotkeys
local act = wezterm.action
config.keys = {
	{ -- Split window horizontally alt+\
		key = "\\",
		mods = "ALT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{ -- Split window vertically alt+-
		key = "-",
		mods = "ALT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{ -- New tab with alt+t
		key = "t",
		mods = "ALT",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{ -- Close pane with alt+w
		key = "x",
		mods = "ALT",
		action = act.CloseCurrentPane({ confirm = false }),
	},
	{ -- New window
		key = "n",
		mods = "ALT",
		action = act.SpawnWindow,
	},
	{ -- Fullscreen
		key = "f",
		mods = "ALT",
		action = act.ToggleFullScreen,
	},
	-- Move between tabs and panes
	{
		key = "h",
		mods = "ALT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "ALT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "ALT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "ALT",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "LeftArrow",
		mods = "ALT",
		action = act.ActivateTabRelative(-1),
	},
	{
		key = "RightArrow",
		mods = "ALT",
		action = act.ActivateTabRelative(1),
	},
}

wezterm.on("update-right-status", function(window, pane)
	local cwd_uri = pane:get_current_working_dir()
	cwd = " " .. cwd_uri.file_path .. " "
	local date = wezterm.strftime(" %d/%m/%Y %H:%M ")

	local battery1 = "󱊡"
	local battery2 = "󱊢"
	local battery3 = "󱊣"

	local bat = ""
	for _, b in ipairs(wezterm.battery_info()) do
		bat = string.format("%.0f%%", b.state_of_charge * 100)
		if b.state_of_charge * 100 > 80 then
			battery_ico = battery3
		elseif b.state_of_charge * 100 > 30 then
			battery_ico = battery2
		else
			battery_ico = battery1
		end
	end

	local folder = ""
	local calendar = ""

	window:set_right_status(wezterm.format({
		{ Foreground = { Color = "#11111c" } },
		{ Background = { Color = "#a6e3a1" } },
		{ Text = " " .. folder .. " " },
	}) .. wezterm.format({
		{ Foreground = { Color = "#ffffff" } },
		{ Text = cwd },
	}) .. wezterm.format({
		{ Foreground = { Color = "#11111c" } },
		{ Background = { Color = "#89b4fa" } },
		{ Text = " " .. calendar .. " " },
	}) .. wezterm.format({
		{ Foreground = { Color = "#ffffff" } },
		{ Text = date },
	}) .. wezterm.format({
		{ Foreground = { Color = "#11111c" } },
		{ Background = { Color = "#cba6f7" } },
		{ Text = " " .. battery_ico .. " " },
	}) .. wezterm.format({
		{ Foreground = { Color = "#ffffff" } },
		{ Text = " " .. bat .. " " },
	}))
end)

function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return " " .. title .. " "
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return " " .. tab_info.active_pane.title .. " "
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab_title(tab)
	if tab.is_active then
		return {
			{ Background = { Color = "#fab387" } },
			{ Text = title },
		}
	end
	return title
end)

return config
