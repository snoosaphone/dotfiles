local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'darkmatrix'
config.color_scheme = 'Gruvbox dark, hard (base16)'
-- config.color_scheme = 's3r0 modified (terminal.sexy)'

config.color_scheme = 'Mashup Colors (terminal.sexy)'

config.font = wezterm.font 'Inconsolata Nerd Font Mono'
config.font_size = 12.5
config.enable_tab_bar = false
config.window_close_confirmation = 'NeverPrompt'
config.window_padding = {
    left = '0',
    right = '0',
    top = '0',
    bottom = '0'
}

config.window_background_opacity = 0.97

return config
