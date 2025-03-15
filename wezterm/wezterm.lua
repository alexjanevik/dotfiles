local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

---- Font and theme
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 12

-- config.color_scheme = "Catppuccin Mocha"
config.color_scheme = "Tokyo Night"

-- Window settings
config.initial_cols = 106
config.initial_rows = 32

config.window_padding = {
	left = "0cell",
	right = "0cell",
	top = "0cell",
	bottom = "0cell",
}

config.enable_scroll_bar = true
config.use_fancy_tab_bar = false
config.scrollback_lines = 1000
config.default_cursor_style = "BlinkingBar"
-- config.window_decorations = "RESIZE"
config.front_end = "WebGpu"
config.skip_close_confirmation_for_processes_named = {
	"zsh",
	"tmux",
}

config.scrollback_lines = 50000
--config.window_background_opacity = 0.92
config.macos_window_background_blur = 25
config.native_macos_fullscreen_mode = false

-- Performance Settings
config.max_fps = 144
config.animation_fps = 60
config.cursor_blink_rate = 300

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.show_tab_index_in_tab_bar = true
config.use_fancy_tab_bar = false

-- Hotkeys
local act = wezterm.action
config.keys = {
	{ -- Split window vertically alt+-
		key = "-",
		mods = "CMD",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	{ -- Split window horizontally alt+\
		key = "\\",
		mods = "CMD",
		action = act.SplitPane({
			direction = "Right",
			size = { Percent = 30 },
		}),
	},

	{ -- Close pane with alt+x
		key = "x",
		mods = "CMD",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	{ -- Fullscreen
		key = "f",
		mods = "CMD",
		action = act.ToggleFullScreen,
	},
	-- Move between tabs and panes
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
