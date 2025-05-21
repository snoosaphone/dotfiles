local wezterm = require('wezterm')

local function setup(config)
    -- Fixing the cursor theme
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

    config.xcursor_theme = xcursor_theme
    config.xcursor_size = xcursor_size
    -- end cursor theme

    return config
end

return {
    setup = setup,
}
