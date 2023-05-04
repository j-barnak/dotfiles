local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.hide_tab_bar_if_only_one_tab = true

config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.font = wezterm.font("Berkeley Mono", { weight = "Regular", stretch = "Normal", style = "Normal" })

config.color_scheme = 'Monokai Pro (Gogh)'

config.window_padding = {
  left = '0cell',
  right = '0cell',
  top = '0cell',
  bottom = '0cell',
}

wezterm.on('update-right-status', function(window, pane)
  window:set_right_status(window:active_workspace())
end)

config.keys = {
  -- Switch to the default workspace
  {
    key = 'y',
    mods = 'CTRL|SHIFT',
    action = act.SwitchToWorkspace {
      name = 'default',
    },
  },
  -- Switch to a monitoring workspace, which will have `top` launched into it
  {
    key = 'u',
    mods = 'CTRL|SHIFT',
    action = act.SwitchToWorkspace {
      name = 'monitoring',
      spawn = {
        args = { 'top' },
      },
    },
  },
  -- Create a new workspace with a random name and switch to it
  { key = 'i', mods = 'CTRL|SHIFT', action = act.SwitchToWorkspace },
  -- Show the launcher in fuzzy selection mode and have it list all workspaces
  -- and allow activating one.
  {
    key = '9',
    mods = 'ALT',
    action = act.ShowLauncherArgs {
      flags = 'FUZZY|WORKSPACES',
    },
  },
  {
    key = '9',
    mods = 'ALT',
    action = act.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' },
  },
  { key = 'n', mods = 'CTRL',       action = act.SwitchWorkspaceRelative(1) },
  { key = 'p', mods = 'CTRL',       action = act.SwitchWorkspaceRelative(-1) },

}

return config
