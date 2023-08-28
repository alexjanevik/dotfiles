local wezterm = require 'wezterm'
local table = require 'table'
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- Font and theme
--
config.font = wezterm.font 'Fira Code'
config.font_size = 12

--config.font = wezterm.font 'ProggyClean Nerd Font Mono'
--config.font_size = 18 

config.color_scheme = 'Catppuccin Macchiato'

-- Window settings
config.initial_cols = 100
config.initial_rows = 30
config.window_padding = {
    left = '4cell',
    right = '0cell',
    top = '2.5cell',
    bottom = '1cell',
}
config.enable_scroll_bar = true
config.use_fancy_tab_bar = false
config.window_close_confirmation = 'NeverPrompt'
config.scrollback_lines = 1000
config.default_cursor_style = 'BlinkingBar'

--[[ Fullscreen on start
local mux = wezterm.mux
wezterm.on("gui-startup", function()
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():toggle_fullscreen()
end)
config.native_macos_fullscreen_mode = true
--]]

-- Hotkeys
local act = wezterm.action
config.keys = {
    { -- View all tabs cmd+shift+t
        key = 't',
        mods = 'CMD|SHIFT',
        action = act.ShowTabNavigator,
    },
    { -- Open wezterm config shortcut cmd+,
            key = ',',
            mods = 'CMD',
            action = act.SpawnCommandInNewTab {
                args = {
                'vim',
                os.getenv('WEZTERM_CONFIG_FILE'),
            },
        },
    },
    { -- Open vimrc shortcut cmd+,
            key = '.',
            mods = 'CMD',
            action = act.SpawnCommandInNewTab {
                args = {
                'vim',
                os.getenv('HOME')..'/.dotfiles/.vimrc',
            },
        },
    },
    { -- Split window horizontally cmd+shift+d
        key = 'd',
        mods = 'CMD|SHIFT',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    { -- Split window vertically cmd+shift+s
        key = 's',
        mods = 'CMD|SHIFT',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    { -- Close pane with cmd+w
        key = 'w',
        mods = 'CMD',
        action = wezterm.action.CloseCurrentPane { confirm = true },
    },
}

-- SSH configs
config.ssh_domains = {
    { -- UQ moss                                                                                         
        name = 'moss',                                                                  
        remote_address = 'moss.labs.eait.uq.edu.au',
        username = 's4704158',
    },
}

-- Status bar
wezterm.on('update-status', function(window, pane)
	local cwd = " "..pane:get_current_working_dir():sub(8).." " -- remove file:// uri prefix
	local date = wezterm.strftime(" %b %-d %H:%M:%S ")
	local hostname = " "..wezterm.hostname().." "

    local dot = hostname:find("[.]")
    if dot then
        hostname = hostname:sub(1, dot-1)
        hostname = hostname..' '
    end
    
    local battery = ''
    for _, b in ipairs(wezterm.battery_info()) do
        battery = string.format(' %.0f%% ', b.state_of_charge * 100)
    end 

    local black_text = '#222635'

    local accent = '#cba6f7';

    local battery_printed = {}
    if battery ~= '' then
        table.insert(battery_printed, {Background={Color=accent}})
        table.insert(battery_printed, {Foreground={Color=black_text}})
        table.insert(battery_printed, {Text=""})
        table.insert(battery_printed, {Foreground={Color=black_text}})
        table.insert(battery_printed, {Background={Color=accent}})
        table.insert(battery_printed, {Text=battery})
    end
    
	window:set_right_status(
	    wezterm.format({
			{Foreground={Color="#ffffff"}},
			{Text=cwd},
			{Foreground={Color=accent}},
			{Text=""},
			{Foreground={Color=black_text}},
			{Background={Color=accent}},
			{Text=date},
			{Foreground={Color=black_text}},
			{Background={Color=accent}},
            {Text=""},
			{Foreground={Color=black_text}},
			{Background={Color=accent}},
			{Text=hostname},
        })..
        wezterm.format(battery_printed)
    )
end)

return config 
