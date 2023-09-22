local wezterm = require 'wezterm'

return {
    check_for_updates = false,
    enable_scroll_bar = false,
    keys = {
        {
            key = 'F11',
            action = wezterm.action.ToggleFullScreen,
        },
    },
    font = wezterm.font 'Fira Code',
    font_size = 18.0,
    hide_tab_bar_if_only_one_tab = true,
    warn_about_missing_glyphs = true,
}

