local wezterm = require 'wezterm'

return {
    check_for_updates = false,
    enable_scroll_bar = true,
    keys = {
        {
            key = 'F11',
            action = wezterm.action.ToggleFullScreen,
        },
    },
    font = wezterm.font 'Fira Code',
    hide_tab_bar_if_only_one_tab = true,
    warn_about_missing_glyphs = false,
}

