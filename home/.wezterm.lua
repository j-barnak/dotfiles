local wezterm = require("wezterm")
local act = wezterm.action

wezterm.on("update-right-status", function(window, pane)
	window:set_right_status(window:active_workspace())
end)

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.hide_tab_bar_if_only_one_tab = true

config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

config.font = wezterm.font("FiraCode Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal" })

config.font_size = 16.0

config.colors = {
	cursor_bg = "white",
	cursor_fg = "black",
}

config.cursor_blink_rate = 0
-- config.force_reverse_video_cursor = true

config.color_scheme = "Monokai Pro (Gogh)"

config.window_padding = {
	left = "0cell",
	right = "0cell",
	top = "0cell",
	bottom = "0cell",
}

config.keys = {
	-- Switch to the default workspace
	{
		key = " ",
		mods = "SHIFT|CTRL",
		action = act.SwitchToWorkspace({
			name = "default",
		}),
	},
	-- Create a new workspace with a random name and switch to it
	{
		key = "i",
		mods = "SHIFT|CTRL",
		action = act.SwitchToWorkspace,
	},
	-- Show the launcher in fuzzy selection mode and have it list all workspaces
	-- and allow activating one.
	{
		key = "f",
		mods = "SHIFT|CTRL",
		action = act.ShowLauncherArgs({
			flags = "FUZZY|WORKSPACES",
		}),
	},
	{
		key = "j",
		mods = "SHIFT|CTRL",
		action = act.SwitchWorkspaceRelative(1),
	},
	{
		key = "k",
		mods = "SHIFT|CTRL",
		action = act.SwitchWorkspaceRelative(-1),
	},
	{
		key = ":",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = "l",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ShowLauncher,
	},
	{
		key = "l",
		mods = "ALT",
		action = wezterm.action.ShowDebugOverlay,
	},
}

return config
