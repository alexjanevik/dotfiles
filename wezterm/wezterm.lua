local wezterm = require("wezterm")
local config = {}
local nvim_helpers = require("nvim_helpers")

if wezterm.config_builder then
	config = wezterm.config_builder()
end

---- Font and theme
config.font = wezterm.font("JetBrains Mono")
config.font_size = 12

-- config.color_scheme = "Tokyo Night"
-- config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "CursorDark"
config.color_scheme = "OneDark (base16)"

-- Window settings
config.initial_cols = 80
config.initial_rows = 24

config.window_padding = {
	left = "2cell",
	right = "2cell",
	top = "0cell",
	bottom = "0cell",
}

config.enable_scroll_bar = false
config.scrollback_lines = 1000
config.default_cursor_style = "BlinkingBar"
config.window_decorations =
	"MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR | TITLE | INTEGRATED_BUTTONS | RESIZE | MACOS_FORCE_ENABLE_SHADOW"
config.front_end = "WebGpu"

--config.term = "xterm-kitty"
config.enable_kitty_graphics = true
config.skip_close_confirmation_for_processes_named = {
	"zsh",
	"tmux",
}

config.scrollback_lines = 5000
config.macos_window_background_blur = 20
config.window_background_opacity = 0.965
config.text_background_opacity = 0.965
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
	-- Move between tabs
	{
		key = "l",
		mods = "CMD",
		action = act.ActivateTabRelative(1),
	},
	{
		key = "h",
		mods = "CMD",
		action = act.ActivateTabRelative(-1),
	},
	-- send cmd+enter to nvim as <0xAA>
	nvim_helpers.bind_super_key_to_vim("Enter"),
}

-- tokyo night
-- config.colors = {
-- 	tab_bar = {
-- 		background = "1a1b26",
-- 		active_tab = {
-- 			fg_color = "9ece6a",
-- 			bg_color = "1a1b26",
-- 		},
-- 		inactive_tab = {
-- 			fg_color = "565f89",
-- 			bg_color = "1a1b26",
-- 		},
-- 	},
-- }
-- atom dark
config.colors = {
	tab_bar = {
		background = "rgb(41,44,51)",
		active_tab = {
			fg_color = "rgb(161,194,129)",
			bg_color = "rgb(41,44,51)",
		},
		inactive_tab = {
			fg_color = "rgb(128,132,141)",
			bg_color = "rgb(41,44,51)",
		},
	},
}

return config
