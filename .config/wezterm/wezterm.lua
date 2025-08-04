local wezterm = require 'wezterm'
local act = wezterm.action

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
    mouse_bindings = {
        {
            event = { Down = { streak = 1, button = "Right" } },
            mods = "NONE",
            action = wezterm.action_callback(function(window, pane)
                local has_selection = window:get_selection_text_for_pane(pane) ~= ""
                if has_selection then
                    window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
                    window:perform_action(act.ClearSelection, pane)
                else
                    window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
                end
            end),
            selection_word_boundary = " ",
        },
    },
    default_prog = {
        os.getenv("SHELL"), "--login -i",
    },

}

