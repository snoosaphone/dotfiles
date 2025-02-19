local wezterm = require 'wezterm'

local xcursor_size = nil
local xcursor_theme = nil

local success, stdout, _ = wezterm.run_child_process({
    "gsettings",
    "get",
    "org.gnome.desktop.interface",
    "cursor-theme"
})
if success then
    xcursor_theme = stdout:gsub("'(.+)'\n", "%1")
end

local success, _, _ = wezterm.run_child_process({
    "gsettings",
    "get",
    "org.gnome.desktop.interface",
    "cursor-size"
})
if success then
    xcursor_size = tonumber(stdout)
end

local config = wezterm.config_builder()

-- config.color_scheme = 'darkmatrix'
config.color_scheme = 's3r0 modified (terminal.sexy)'
-- config.color_scheme = 'Mashup Colors (terminal.sexy)'
-- config.color_scheme = 'Gruvbox dark, pale (base16)'
config.color_scheme = 'Gruvbox Material (Gogh)'

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
config.xcursor_theme = xcursor_theme
config.xcursor_size = xcursor_size

return config
