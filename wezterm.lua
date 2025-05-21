local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- Visual options
config.color_scheme = 's3r0 modified (terminal.sexy)'
-- config.color_scheme = 'darkmatrix'
-- config.color_scheme = 'Mashup Colors (terminal.sexy)'
-- config.color_scheme = 'Gruvbox dark, pale (base16)'
-- config.color_scheme = 'Gruvbox Material (Gogh)'

config.font = wezterm.font 'Inconsolata Nerd Font Mono'
config.font_size = 12
config.enable_tab_bar = false
config.window_close_confirmation = 'NeverPrompt'
config.window_padding = {
    left = '0',
    right = '0',
    top = '0',
    bottom = '0'
}
-- config.window_background_opacity = 0.9
-- end visual options

config.automatically_reload_config = true

local local_config_filename = os.getenv('HOME') .. '/.config/wezterm/local.lua'
local local_config = io.open(local_config_filename, 'r')
if local_config~=nil then
    local local_setup = require('local')
    config = local_setup.setup(config)
end

return config
