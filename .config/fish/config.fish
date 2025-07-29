if status is-interactive
    set -gx fish_greeting
    set -gx fish_color_command ebde34 # Set the color of text that I type on the command line
    set -gx fifc_editor nvim

    source $__fish_config_dir/alias_abbr.fish
    source $__fish_config_dir/shell_integrations.fish

    if not functions -q fisher
        echo "Installing fisher ..."
        curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish \
            | source && fisher install jorgebucaran/fisher
    end

    if not contains gazorby/fifc (fisher list)
        echo "Installing gazorby/fifc"
        fisher install gazorby/fifc
    end

    fish_vi_key_bindings

    bind --user -M insert \ck up-or-search
    bind --user -M insert \cj down-or-search
end

