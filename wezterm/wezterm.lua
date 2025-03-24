local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

---- Font and theme
config.font = wezterm.font("Fira Code")
config.font_size = 12

-- config.color_scheme = "Catppuccin Mocha"
config.color_scheme = "Tokyo Night"

-- Window settings
config.initial_cols = 100
config.initial_rows = 36

config.window_padding = {
	left = "0cell",
	right = "0cell",
	top = "0cell",
	bottom = "0cell",
}

config.enable_scroll_bar = false
config.scrollback_lines = 1000
config.default_cursor_style = "BlinkingBar"
config.window_decorations = "RESIZE"
config.front_end = "WebGpu"
--config.enable_wayland = false

config.term = "xterm-kitty"
config.enable_kitty_graphics = true
config.skip_close_confirmation_for_processes_named = {
	"zsh",
	"tmux",
}

config.scrollback_lines = 5000
config.window_background_opacity = 0.965
config.text_background_opacity = 0.965
config.macos_window_background_blur = 20
config.native_macos_fullscreen_mode = true

-- Performance Settings
config.max_fps = 144
config.animation_fps = 60
config.cursor_blink_rate = 350

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.show_tab_index_in_tab_bar = true
config.use_fancy_tab_bar = false

-- Hotkeys
local act = wezterm.action
config.keys = {
	{ -- Split window vertically
		key = "-",
		mods = "CMD",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	{ -- Split window horizontally
		key = "\\",
		mods = "CMD",
		action = act.SplitPane({
			direction = "Right",
		}),
	},
	-- Close window / pane
	{
		key = "w",
		mods = "CMD",
		action = act.CloseCurrentTab({ confirm = false }),
	},
	{
		key = "W",
		mods = "CMD|SHIFT",
		action = act.CloseCurrentPane({ confirm = false }),
	},

	{ -- Fullscreen
		key = "f",
		mods = "CMD",
		action = act.ToggleFullScreen,
	},
	-- Move between panes
	{
		key = "h",
		mods = "CMD",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "CMD",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "CMD",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "CMD",
		action = act.ActivatePaneDirection("Down"),
	},
	-- Resize panes
	{
		key = "h",
		mods = "CMD|SHIFT",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "l",
		mods = "CMD|SHIFT",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "k",
		mods = "CMD|SHIFT",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "j",
		mods = "CMD|SHIFT",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},

	{
		key = "m",
		mods = "ALT",
		action = act.RotatePanes("Clockwise"),
	},
	{
		key = "n",
		mods = "ALT",
		action = act.RotatePanes("CounterClockwise"),
	},
}

return config
