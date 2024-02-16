local wezterm = require 'wezterm'

return {
    check_for_updates = false,
    enable_scroll_bar = false,
    keys = {
        {
            key = 'F11',
            action = wezterm.action.ToggleFullScreen,
        },
        {  -- Make Wezterm Interpret SHIFT+3 as #
            key = '£',  -- I'd expect to have 3 here but for whatever reason that doesn't work
            mods = 'SHIFT',
            action = wezterm.action.SendString '#',
        },
    },
    font = wezterm.font 'Fira Code',
    font_size = 18.0,
    hide_tab_bar_if_only_one_tab = true,
    warn_about_missing_glyphs = true,
    window_close_confirmation = 'NeverPrompt',
}

