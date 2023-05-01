local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.hide_tab_bar_if_only_one_tab = true

config.color_scheme = 'Monokai Pro (Gogh)'

config.window_padding = {
    left = '0cell',
    right = '0cell',
    top = '0cell',
    bottom = '0cell',
}

return config
