if status is-interactive
    set -gx fish_greeting
    set -gx fish_color_command ebde34 # Set the color of text that I type on the command line
    set -gx fifc_editor nvim

    source $__fish_config_dir/alias_abbr.fish

    fish_vi_key_bindings

    bind --user -M insert \ck up-or-search
    bind --user -M insert \cj down-or-search

    source $__fish_config_dir/shell_integrations.fish
end

